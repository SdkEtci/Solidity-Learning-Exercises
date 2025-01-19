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
        require(projectIDByName[_projectName] == 0, "The project had previously added.");

        Project memory _newProject = Project({
            id: groupCount,
            projectName: _projectName,
            teamWallets: _teamsWallets,
            voteCount: 0
        });

        projectDetail[groupCount] = _newProject;
        projectIDByName[_newProject.projectName] = _newProject.id;
        identifyWallets(_teamsWallets, groupCount);
        
        groupCount++;
        return true;
    }

    function updateProject(uint8 _id, string memory _newProjectName, address[] memory _newTeamWallets) public{
        require(walletGroup[msg.sender] == _id, "You can not change another project details.");
        
        Project storage _newProject = projectDetail[_id];

        _newProject.projectName = _newProjectName;
        _newProject.teamWallets = _newTeamWallets;
    }

    function identifyWallets(address[] memory _teamsWallets, uint8 _groupNumber) public returns(bool){
        for (uint8 i = 0; i < _teamsWallets.length; i++) 
        {
            require(walletGroup[_teamsWallets[i]] == 0, "Wallet had previously added.");
            walletGroup[_teamsWallets[i]] = _groupNumber;
            isVoted[_teamsWallets[i]] = false; // default value is false
        }
        return true;
    }

    // vote
    function vote(uint8 _projectID) public returns(bool){
        require(_projectID < groupCount, "Invalid project id.");
        require(!getIsVoted(msg.sender), "You have already voted.");
        require(walletGroup[msg.sender] != _projectID, "You can not vote your group.");

        Project storage _project = projectDetail[_projectID];
        _project.voteCount++;

        isVoted[msg.sender] =true;
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
