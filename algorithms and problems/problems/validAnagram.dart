void main() {
  assert(validAnagram().isAnagram("anagram", "nagaram") == true);
  assert(validAnagram().isAnagram("rat", "car") == false);
}

/*
Given two strings s and t, return true if t is an anagram of s, and false otherwise.
An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once

Example 1:

Input: s = "anagram", t = "nagaram"
Output: true
Example 2:

Input: s = "rat", t = "car"
Output: false
 

Constraints:

1 <= s.length, t.length <= 5 * 104
s and t consist of lowercase English letters.

*/

class validAnagram {
  bool isAnagram(String s, String t) {
    bool result = true;

    if (s.length != t.length) {
      result = false;
    } else {
      List<String> arrayS = s.split('');
      List<String> arrayT = t.split('');
      arrayS.sort();
      arrayT.sort();

      for (int i = 0; i < arrayS.length; i++) {
        if (arrayS[i] != arrayT[i]) {
          result = false;
          break;
        }
      }
    }

    return result;
  }
}
