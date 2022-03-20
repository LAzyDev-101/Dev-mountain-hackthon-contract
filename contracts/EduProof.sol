// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts v4.4.1 (token/ERC721/IERC721.sol)
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";

contract EduProof is Ownable {
  struct EIDetail {
    EIStatus status;
    string name;
  }

  enum EIStatus {
    Pending,
    Approved,
    Rovoked
  }

  struct VerifyData {
    EIDetail eiDetail;
    bool isCorret;
  }

  mapping(address => mapping(uint256 => string)) public eTranscriptHash;

  mapping(address => EIDetail) public eiDetails;

  event RegisterEIID(address eiAddress, string name);
  event ApproveEIID(address eiAddress);
  event RevokeEIID(address eiAddress);

  event IssueTranscript(address eiAddress, uint256 studentID);

  function registerEIID(address eiAddress, string calldata name) public {
    eiDetails[eiAddress] = EIDetail({ EIStatus: EIStatus.Pending, name: name });

    emit RegisterEIID(eiAddress, name);
  }

  function approveEIID(address eiAddress) public onlyOwner {
    eiDetail[EIID].status = EIStatus.Approved;
    emit ApproveEIID(eiAddress);
  }

  function revokeEIID(address eiAddress) public onlyOwner {
    eiDetail[EIID].status = EIStatus.Revoked;
    emit RevokeEIID(eiAddress);
  }

  function issueTranscript(uint256 studentID, string calldata hash) public {
    EIDetail memory eiDetail = eiDetails[msg.sender];
    require(eiDetail.isActive == true, "NOT_ALLOW");

    eTranscriptHash[msg.sender][studentID] = hash;

    emit IssueTranscript(msg.sender, studentID);
  }

  function verifyTransript(
    address eiAddress,
    uint256 studentID,
    string calldata hash
  ) public view returns (VerifyData memory data) {
    VerifyData memory data = VerifyData({
      eiDetail: eiDetails[eiAddress],
      isCorrect: hash == eTranscriptHash[eiAddress][studentID]
    });
  }
}
