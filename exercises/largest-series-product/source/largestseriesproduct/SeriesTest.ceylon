import ceylon.test { ... }

// Tests adapted from x-common version 1.0.0
{[String, Integer, Integer?]*} cases => {
  // finds the largest product if span equals length
  ["29", 2, 18],
  // can find the largest product of 2 with numbers in order
  ["0123456789", 2, 72],
  // can find the largest product of 2
  ["576802143", 2, 48],
  // can find the largest product of 3 with numbers in order
  ["0123456789", 3, 504],
  // can find the largest product of 3
  ["1027839564", 3, 270],
  // can find the largest product of 5 with numbers in order
  ["0123456789", 5, 15120],
  // can get the largest product of a big number
  ["73167176531330624919225119674426574742355349194934", 6, 23520],
  // reports zero if the only digits are zero
  ["0000", 2, 0],
  // reports zero if all spans include zero
  ["99099", 3, 0],
  // rejects span longer than string length
  ["123", 4, null],
  // reports 1 for empty string and empty product (0 span)
  ["", 0, 1],
  // reports 1 for nonempty string and empty product (0 span)
  ["123", 0, 1],
  // rejects empty string and nonzero span
  ["", 1, null],
  // rejects invalid character in digits
  ["1234a5", 2, null],
  // rejects negative span
  ["12345", -1, null]
};

test
parameters(`value cases`)
void testLargestProduct(String digits, Integer window, Integer? expected) {
  value result = largestProduct(digits, window);
  if (exists expected) {
    assertEquals(result, expected);
  } else if (!is Error result) {
    fail("should have errored, but got ``result``");
  }
}
