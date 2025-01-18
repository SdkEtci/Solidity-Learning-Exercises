// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract KapsulVoting {

    struct Project {
        uint8 id;
        string projectName;
        address[] teamWallets;
        uint8 voteCount;
    }

    mapping(uint8 => Project) projectDetail;
    mapping(string => uint8) projectIDByName;

    mapping(address => uint8) walletGroup;
    mapping(address => bool) isVoted;

    // addding  projects
    uint8 groupCount = 1;
    function  addProject(string memory _projectName, address[] memory _teamsWallets) public returns(bool){
        require(!isGroupAdded(_projectName), "The project had previously added.");

        Project memory _newProject = Project({
            id: groupCount,
            projectName: _projectName,
            teamWallets: _teamsWallets,
            voteCount: 0
        });

        projectDetail[groupCount] = _newProject;
        identifyWallets(_teamsWallets, groupCount);
        groupCount++;
        return true;

    }
    
    function isGroupAdded(string memory _projectName) view  public returns(bool){
        bytes memory tempEmptyStringTest = bytes(_projectName); 
        if (tempEmptyStringTest.length == 0) {
            return false;
        }
        
        for (uint8 i = 0; i < groupCount; i++) 
        {
            if(keccak256(bytes(projectDetail[i].projectName)) == keccak256(bytes(_projectName)))
                return true;
        }
        return false;
    }

    function identifyWallets(address[] memory _teamsWallets, uint8 _groupNumber) public returns(bool){
        for (uint8 i = 0; i < _teamsWallets.length; i++) 
        {
            require(walletGroup[_teamsWallets[i]] == 0, "Wallet had previously added.");
            walletGroup[_teamsWallets[i]] = _groupNumber;
            isVoted[_teamsWallets[i]] = false;
        }
        return true;
    }

    // vote
    function vote(address _wallet, string memory _projectName) public returns(bool){
        require(isGroupAdded(_projectName), "Please check the group name.");
        require(!getIsVoted(_wallet), "You have already voted.");

        for (uint8 i = 0; i < groupCount; i++) 
        {
            if(keccak256(bytes(projectDetail[i].projectName)) == keccak256(bytes(_projectName))){
                projectDetail[i].voteCount++;
                isVoted[_wallet] = true;
            }  
        }
        return true;
    }
    // getter   functions
    function getWalletGroup(address _wallet) public view returns(uint8) {
        return walletGroup[_wallet];
    }

    function getIsVoted(address _wallet) public view returns(bool) {
        return isVoted[_wallet];
    }

    function getProjectIDByName(string memory _projectName) public view returns(uint8) {
        return projectIDByName[_projectName];
    }

    function getProjectDetail(uint8 _projectID) public view returns(Project memory) {
        return projectDetail[_projectID];
    }
}