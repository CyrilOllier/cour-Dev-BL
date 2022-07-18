
import useEth  from "../../contexts/EthContext/useEth";


function GetVoter() {
  const { state: { contract, accounts} } = useEth();

  const runGetVoter = async () => {
      let valeur=document.getElementById("voterAddress").value;
      await contract.methods.addVoter(valeur).send({ from: accounts[0] })
      
  }

  return(
    <div>
        <h4>Admin get users at WhiteList:</h4>
        <input type="text" id="voterAddress" placeholder="Adresse du voter"/>
        <button onClick={runGetVoter}>Get voter</button>
        </div>
  );

}
    export default GetVoter;