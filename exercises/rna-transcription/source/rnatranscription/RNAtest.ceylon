import ceylon.test { ... }

// Tests adapted from x-common version 1.0.0
{[String, String|Error]*} cases => {
  // empty strand
  ["",                         ""],
  // single C nucleotide strand
  ["C",                       "G"],
  // single G nucleotide strand
  ["G",                       "C"],
  // single A nucleotide strand
  ["A",                       "U"],
  // single T nucleotide strand
  ["T",                       "A"],
  // longer strand
  ["ACGTGGTCTTAA", "UGCACCAGAAUU"],
  // strand with invalid nucleotides
  ["XCGFGGTDTTAA",        Error()],
  // strand with invalid nucleotides after the first nucleotide
  ["ACGTFGTBTEAA",        Error()]
};

test
parameters(`value cases`)
void testHamming(String dna, String|Error expected) {
  String|Error result = transcription(dna);

  if(is String expected) {
    assertEquals(result, expected);
  } else if(!is Error result) {
    fail("should have errored, but got ``result``");
  }
}
