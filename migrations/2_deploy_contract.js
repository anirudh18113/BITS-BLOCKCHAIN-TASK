const QuestionContract = artifacts.require("QuestionBank");
module.exports = async function(deployer){
    var questions=5;
    var totalQuestion=50;
    await deployer.deploy(QuestionContract,questions,totalQuestion);
    const contract = await QuestionContract.deployed();
    const contractAddress = contract.address;
    const contractABI = QuestionContract.abi;
    console.log("Contract address: ", contractAddress);
    console.log("Contract abi: ", contractABI);
};