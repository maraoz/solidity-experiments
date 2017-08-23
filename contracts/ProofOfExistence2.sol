// Proof of Existence contract, version 2
contract ProofOfExistence2 {
  // state
  bytes32[] proofs;


  // store a proof of existence in the contract state
  // *transactional function*
  function storeProof(bytes32 proof) {
    if (proofs.length >= 255) { throw; }
    proofs.push(proof);
  }

  // calculate and store the proof for a document
  // *transactional function*
  function notarize(string document) {
    var proof = calculateProof(document);
    storeProof(proof);
  }

  // helper function to get a document's sha256
  // *read-only function*
  function calculateProof(string document) returns (bytes32) {
    return sha256(document);
  }

  // check if a document has been notarized
  // *read-only function*
  function checkDocument(string document) returns (bool) {
    var proof = calculateProof(document);
    return hasProof(proof);
  }

  // returns true if proof is stored
  // *read-only function*
  function hasProof(bytes32 proof) returns (bool) {
    for (uint8 i = 0; i < proofs.length; i++) {
      if (proofs[i] == proof) {
        return true;
      }
    }
    return false;
  }
}
