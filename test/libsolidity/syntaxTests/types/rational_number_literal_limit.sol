contract c {
    function bignum() public {
        uint a;
        uint b;
        a = 1e9999;
				b = 13456232453246423445233516816351681345623245324642344523351681635168.7161354161363516163161354168154E1200;
    }
}
// ----
// TypeError: Invalid literal value.
