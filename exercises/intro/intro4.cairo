
// Remember add function from before? The `add` function below does the exact same
// thing! If you skip out a `semicolon` at the end of the function, the function 
// returns the result of that statement. Pretty neat, eh?
//
// Young Starkling, Joe, tried to write his own `sub` function, but his function
// won't compile. Can you help him out?

fn add(a: felt, b: felt) -> felt {
    a + b
}

// Edit this function
fn sub(a: felt, b: felt) -> felt {
    a - b
}

fn main() -> felt{
   add(3, 5);
   sub(11, 7)
}