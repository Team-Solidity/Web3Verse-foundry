// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Web3Verse {
    address public owner;

    struct User {
        string username;
        address userAddress;
        address[] followers;
        address[] following;
        uint256[] likedPosts;
    }

    struct Post {
        uint256 postId;
        address author;
        string content;
        uint256 timestamp;
        address[] likes;
        uint256 nftid;
    }

    mapping(address => User) public users;
    mapping(string => address) public usadd;
    Post[] public posts;

    event PostCreated(uint256 indexed postId, address indexed author, string content, uint256 timestamp);
    event UserFollowed(address indexed follower, address indexed following);
    event PostLiked(address indexed liker, uint256 indexed postId);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    modifier userExists() {
        require(bytes(users[msg.sender].username).length != 0, "User does not exist");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function registerUser(string memory _username) external {
        require(bytes(_username).length > 0, "Username cannot be empty");
        require(bytes(users[msg.sender].username).length == 0, "User already registered");

        users[msg.sender] = User(_username, msg.sender, new address[](0), new address[](0), new uint256[](0));
        usadd[_username] = msg.sender;
    }

    function createPost(string memory _content, uint256 _nftid) external userExists {
        uint256 postId = posts.length;
        posts.push(Post(postId, msg.sender, _content, block.timestamp, new address[](0), _nftid));

        emit PostCreated(postId, msg.sender, _content, block.timestamp);
    }

    function getUserProfile(string memory usname) external view userExists returns (address) {
        address tempadd = usadd[usname];
        require(tempadd != address(0), "No User");
        return tempadd;
    }

    function getPost(uint256 _postId) external view returns (uint256, address, string memory, uint256, address[] memory) {
        require(_postId < posts.length, "Post does not exist");

        Post memory post = posts[_postId];
        return (post.postId, post.author, post.content, post.timestamp, post.likes);
    }

    function followUser(address _userToFollow) external userExists {
        require(_userToFollow != address(0), "Invalid user address");
        require(_userToFollow != msg.sender, "Cannot follow yourself");

        users[msg.sender].following.push(_userToFollow);
        users[_userToFollow].followers.push(msg.sender);

        emit UserFollowed(msg.sender, _userToFollow);
    }

    function likePost(uint256 _postId) external userExists {
        require(_postId < posts.length, "Post does not exist");
        require(!isPostLiked(_postId), "Post already liked");

        users[msg.sender].likedPosts.push(_postId);
        posts[_postId].likes.push(msg.sender);
        
        emit PostLiked(msg.sender, _postId);
    }

    function isPostLiked(uint256 _postId) public view returns (bool) {
        for (uint256 i = 0; i < users[msg.sender].likedPosts.length; i++) {
            if (users[msg.sender].likedPosts[i] == _postId) {
                return true;
            }
        }
        return false;
    }

    function getFollowers() external view userExists returns (address[] memory) {
        return users[msg.sender].followers;
    }

    function getFollowing() external view userExists returns (address[] memory) {
        return users[msg.sender].following;
    }
}