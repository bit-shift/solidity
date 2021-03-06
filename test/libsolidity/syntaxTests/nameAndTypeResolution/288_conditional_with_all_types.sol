contract C {
    struct s1 {
        uint x;
    }
    s1 struct_x;
    s1 struct_y;

    function fun_x() public {}
    function fun_y() public {}

    enum small { A, B, C, D }

    mapping(uint8 => uint8) table1;
    mapping(uint8 => uint8) table2;

    function f() public {
        // integers
        uint x;
        uint y;
        uint g = true ? x : y;
        g += 1; // Avoid unused var warning

        // integer constants
        uint h = true ? 1 : 3;
        h += 1; // Avoid unused var warning

        // string literal
        var i = true ? "hello" : "world";
        i = "used"; //Avoid unused var warning
    }
    function f2() public {
        // bool
        bool j = true ? true : false;
        j = j && true; // Avoid unused var warning

        // real is not there yet.

        // array
        byte[2] memory a;
        byte[2] memory b;
        var k = true ? a : b;
        k[0] = byte(0); //Avoid unused var warning

        bytes memory e;
        bytes memory f;
        var l = true ? e : f;
        l[0] = byte(0); // Avoid unused var warning

        // fixed bytes
        bytes2 c;
        bytes2 d;
        var m = true ? c : d;
        m &= m;

    }
    function f3() public {
        // contract doesn't fit in here

        // struct
        struct_x = true ? struct_x : struct_y;

        // function
        var r = true ? fun_x : fun_y;
        r(); // Avoid unused var warning
        // enum
        small enum_x;
        small enum_y;
        enum_x = true ? enum_x : enum_y;

        // tuple
        var (n, o) = true ? (1, 2) : (3, 4);
        (n, o) = (o, n); // Avoid unused var warning
        // mapping
        var p = true ? table1 : table2;
        p[0] = 0; // Avoid unused var warning
        // typetype
        var q = true ? uint32(1) : uint32(2);
        q += 1; // Avoid unused var warning
        // modifier doesn't fit in here

        // magic doesn't fit in here

        // module doesn't fit in here
    }
}
// ----
// Warning: (546-551): Use of the "var" keyword is deprecated.
// Warning: (878-883): Use of the "var" keyword is deprecated.
// Warning: (1008-1013): Use of the "var" keyword is deprecated.
// Warning: (1150-1155): Use of the "var" keyword is deprecated.
// Warning: (1357-1362): Use of the "var" keyword is deprecated.
// Warning: (1560-1561): Use of the "var" keyword is deprecated.
// Warning: (1563-1564): Use of the "var" keyword is deprecated.
// Warning: (1672-1677): Use of the "var" keyword is deprecated.
// Warning: (1778-1783): Use of the "var" keyword is deprecated.
// Warning: (984-998): This declaration shadows an existing declaration.
// Warning: (90-116): Function state mutability can be restricted to pure
// Warning: (121-147): Function state mutability can be restricted to pure
// Warning: (257-632): Function state mutability can be restricted to pure
// Warning: (637-1194): Function state mutability can be restricted to pure
