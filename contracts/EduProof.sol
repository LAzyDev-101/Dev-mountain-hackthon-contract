// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.1 (token/ERC721/IERC721.sol)
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";

contract EduProof is Ownable {
  struct EIDetail {
    EIStatus status;
    string name;
    string EIID;
    string secretHash;
  }

  enum EIStatus {
    Pending,
    Approved,
    Revoked
  }

  struct VerifyData {
    EIDetail eiDetail;
    bool isCorret;
  }

  mapping(address => mapping(uint256 => string)) public eTranscriptHash;

  mapping(address => EIDetail) public eiDetails;

  event RegisterEIID(
    address eiAddress,
    string name,
    string eiid,
    string secretHash
  );
  event ApproveEIID(address eiAddress);
  event RevokeEIID(address eiAddress);

  event IssueTranscript(address eiAddress, uint256 studentID);

  function registerEIID(
    string calldata eiid,
    string calldata name,
    string calldata secretHash
  ) public {
    require(eiDetails[msg.sender] != EIStatus.Pending, "ALREADY_REGISTERD");
    eiDetails[msg.sender] = EIDetail({
      status: EIStatus.Pending,
      name: name,
      EIID: eiid,
      secretHash: secretHash
    });

    emit RegisterEIID(eiAddress, name, eiid, secretHash);
  }

  function approveEIID(address eiAddress) public onlyOwner {
    eiDetails[eiAddress].status = EIStatus.Approved;
    emit ApproveEIID(eiAddress);
  }

  function revokeEIID(address eiAddress) public onlyOwner {
    eiDetails[eiAddress].status = EIStatus.Revoked;
    emit RevokeEIID(eiAddress);
  }

  function issueTranscript(uint256 studentID, string calldata hash) public {
    EIDetail memory eiDetail = eiDetails[msg.sender];
    require(eiDetail.status == EIStatus.Approved, "NOT_ALLOWED");

    eTranscriptHash[msg.sender][studentID] = hash;

    emit IssueTranscript(msg.sender, studentID);
  }

  function verifyTransript(
    address eiAddress,
    uint256 studentID,
    string memory hash
  ) public view returns (VerifyData memory data) {
    string memory hashInChain = eTranscriptHash[eiAddress][studentID];
    VerifyData memory data = VerifyData({
      eiDetail: eiDetails[eiAddress],
      isCorrect: _hashCompare(hashInChain, hash)
    });
    return data
  }

  function _hashCompare(string memory hash1, string memory hash2)
    internal
    view
    returns (bool)
  {
    return
      keccak256(abi.encodePacked((hash1))) ==
      keccak256(abi.encodePacked((hash2)));
  }
}
