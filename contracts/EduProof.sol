// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.1 (token/ERC721/IERC721.sol)
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";

contract EduProof is Ownable {
  struct EIDetail {
    EIStatus status;
    string name;
    string EIID;
    bytes32 secretHash;
    bool isRegistered;
    address _address;
  }

  enum EIStatus {
    Pending,
    Approved,
    Revoked
  }

  struct VerifyData {
    string issuerName;
    address issuerPublicKey;
    bool isCorrect;
  }

  mapping(address => mapping(uint256 => bytes32)) public eTranscriptHash;

  mapping(address => EIDetail) public eiDetails;
  mapping(uint256 => address) public idTOEIAddress;
  uint256 public idCounter = 0;

  event RegisterEIID(
    address eiAddress,
    string name,
    string eiid,
    bytes32 secretHash
  );
  event ApproveEIID(address eiAddress);
  event RevokeEIID(address eiAddress);

  event IssueTranscript(address eiAddress, uint256 studentID);

  function getALLEI() public view returns(EIDetail[] memory) {
      EIDetail[] memory eiPendingList = new EIDetail[](idCounter);
      for(uint i=0;i<idCounter;i++) {
        eiPendingList[i] = eiDetails[idTOEIAddress[i]];
      }
      return eiPendingList;
  }

  function registerEIID(
    string calldata eiid,
    string calldata name,
    bytes32 secretHash
  ) public {
    require(
      eiDetails[msg.sender].isRegistered == false,
      "ALREADY_REGISTERED"
    );
    
    eiDetails[msg.sender] = EIDetail({
      status: EIStatus.Pending,
      name: name,
      EIID: eiid,
      secretHash: secretHash,
      isRegistered: true,
      _address: msg.sender
    });
    
    idTOEIAddress[idCounter] = msg.sender;
    ++idCounter;
    emit RegisterEIID(msg.sender, name, eiid, secretHash);
  }

  function approveEIID(address eiAddress, string memory secretWord)
    public
    onlyOwner
  {
    EIDetail storage eiDetail = eiDetails[eiAddress];
    require(eiDetail.secretHash == _hashString(secretWord), "INVALID_SECRET");
    eiDetail.status = EIStatus.Approved;

    emit ApproveEIID(eiAddress);
  }

  function revokeEIID(address eiAddress) public onlyOwner {
    eiDetails[eiAddress].status = EIStatus.Revoked;
    emit RevokeEIID(eiAddress);
  }

  function issueTranscript(uint256 studentID, bytes32 hash) public {
    EIDetail memory eiDetail = eiDetails[msg.sender];
    require(eiDetail.status == EIStatus.Approved, "NOT_ALLOWED");

    eTranscriptHash[msg.sender][studentID] = hash;

    emit IssueTranscript(msg.sender, studentID);
  }

  function verifyTranscript(
    address eiAddress,
    uint256 studentID,
    bytes32 hash
  ) public view returns (VerifyData memory) {
    bytes32 hashInChain = eTranscriptHash[eiAddress][studentID];
    VerifyData memory data = VerifyData({
      issuerName:eiDetails[eiAddress].name,
      issuerPublicKey:eiAddress,
      isCorrect: _hashCompare(hashInChain, hash)
    });

    return data;
  }

  function _hashCompare(bytes32 hash1, bytes32 hash2)
    internal
    pure
    returns (bool)
  {
    return hash1 == hash2;
  }

  function _hashString(string memory data) public pure returns (bytes32) {
    return sha256(abi.encodePacked(data));
  }
}
