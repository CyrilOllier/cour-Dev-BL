
import useEth  from "../../contexts/EthContext/useEth";


function AddProposal() {
  const { state: { contract, accounts} } = useEth();

  const runAddProposal = async () => {
      let valeur=document.getElementById("voterAddress").value;
      await contract.methods.addProposal(valeur).send({ from: accounts[0] })
      
  }

  return(
    <div>
        <h4>users add proposal :</h4>
        <input type="text" id="voterAddress" placeholder="Adresse du voter"/>
        <button onClick={runAddProposal}>Add Proposal</button>
        </div>
  );

}
    export default AddProposal;