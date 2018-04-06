contract c {
    function f() public pure {
        int a;
        a = 2 << 4096;
    }
}
// ----
// TypeError: Type int_const 2088...(1226 digits omitted)...0672 is not implicitly convertible to expected type int256.
