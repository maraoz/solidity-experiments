// Proof of Existence contract, version 1
contract ProofOfExistence1 {
  // state
  bytes32 public proof;


  // constructor
  function ProofOfExistence() {
  }


  // calculate and store the proof for a document
  function notarize(string document) {
    proof = calculateProof(document);
  }

  // helper function to get a document's sha256
  function calculateProof(string document) returns (bytes32) {
    return sha256(document);
  }
}
