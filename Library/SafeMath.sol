// ----------------------------------------------------------------------------
 18 // Safe maths
 19 // ----------------------------------------------------------------------------
 20 library SafeMath {
 21     function add(uint a, uint b) internal pure returns (uint c) {
 22         c = a + b;
 23         require(c >= a);
 24     }
 25     function sub(uint a, uint b) internal pure returns (uint c) {
 26         require(b <= a);
 27         c = a - b;
 28     }
 29     function mul(uint a, uint b) internal pure returns (uint c) {
 30         c = a * b;
 31         require(a == 0 || c / a == b);
 32     }
 33     function div(uint a, uint b) internal pure returns (uint c) {
 34         require(b > 0);
 35         c = a / b;
 36     }
 37 }