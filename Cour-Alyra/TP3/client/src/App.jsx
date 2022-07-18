import { EthProvider } from "./contexts/EthContext";
//import VotingPage from "./components/VotingPage/"; //import du dossier contenant les fragments ou frameset tuto d'utilisation
//import VotingDemo from "./components/VotingDemo/"; //import du dossier contenant les fragments ou frameset de voting.sol
//import Intro from "./components/Intro/";
//import Setup from "./components/Setup";
//import Demo from "./components/Demo";
import Voting from "./components/Voting";
//import Footer from "./components/Footer";
import "./App.css";

function App() {
  return (
    <EthProvider>
      <div id="App" >
        <div className="container">
       {/*  <VotingPage /> */}
          <hr />
       <Voting /> 
          <hr />
         {/* <VotingDemo />
          <hr /> */}
       {/*   <Intro />
          <hr />
          <Setup />
          <hr />
          <Demo />
          <hr />
  <Footer /> */ }
        </div>
      </div>
    </EthProvider>
  );
}

export default App;
