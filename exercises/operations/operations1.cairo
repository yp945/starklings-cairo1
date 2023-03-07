// Felts accepted +, -, * but not /
// Beside that, felts also support comparison operators
// <, >, <=, >=, ==, !=
// Fill in the rest of the line that has code missing!



// TODO
// Return the solution of x^3 + y - 2


fn poly(x : felt, y: felt) ->  felt {
    let res = x * x * x + y - 2;
    res
}

// Do not change the test function
#[test]
fn test_poly(){
    let res = poly(5,3);
    debug::print_felt(res);
    assert(res==126, 'Error message');
    assert(res < 300, 'res < 300');
    assert(res <= 300, 'res <= 300');
    assert(res > 20, 'res > 2');
    assert(res >= 2, 'res >= 2');
    assert(res != 27, 'res != 27');

}

