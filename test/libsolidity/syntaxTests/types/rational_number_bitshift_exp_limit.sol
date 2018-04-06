contract c {
    function f() public pure {
        int a;
        a = 2e99 << 2000;
    }
}
// ----
// TypeError: Type int_const 2296...(694 digits omitted)...0000 is not implicitly convertible to expected type int256.
