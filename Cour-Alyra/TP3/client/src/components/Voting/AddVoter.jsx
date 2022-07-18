
import useEth  from "../../contexts/EthContext/useEth";


function AddVoter() {
  const { state: { contract, accounts} } = useEth();

  const runAddVoter = async () => {
      let valeur=document.getElementById("voterAddress").value;
      await contract.methods.addVoter(valeur).send({ from: accounts[0] })
      
  }

  return(
    <div>
        <h4>Admin add users at WhiteList:</h4>
        <input type="text" id="voterAddress" placeholder="Adresse du voter"/>
        <button onClick={runAddVoter}>Add voter</button>
        </div>
  );

}
    export default AddVoter;