import Welcome1 from "./Welcome1";
//import Tree1 from "./Tree1";
//import Desc1 from "./Desc1";
//import Desc2 from "./Desc2";
import AddVoter from "./AddVoter";
import GetVoter from "./GetVoter";
import AddProposal from "./AddProposal";

function VotingPage() {
  
  return (
    <div className="demo">
    
      <Welcome1 />      
      <AddVoter />
      <GetVoter />
      <AddProposal />
      {/*<Tree1 />
      <Desc1 />
  <Desc2 />*/}
    
    
      </div>
  );
}

export default VotingPage;
