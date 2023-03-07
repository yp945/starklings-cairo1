// traits1.cairo
// Time to implement some traits!

// Your task is to implement the trait
// `AnimalTrait` for the type `Animal`
//
// Execute `starklings hint traits1` or use the `hint` watch subcommand for a hint.

// Fill in the impl block to make the code work.


#[derive(Copy, Drop)]
struct Animal {
    noise: felt
}

trait AnimalTrait {
    fn new(noise: felt) -> Animal;
    fn make_noise(self: Animal) -> felt;
}

impl AnimalImpl of AnimalTrait {
    fn new(noise: felt) -> Animal {
         Animal {noise: noise}
    }

    fn make_noise(self: Animal) -> felt {
        self.noise
    }
}

#[test]
fn test_traits1() {
    // TODO make the test pass by creating two instances of Animal
    // and calling make_noise on them
    let cat = AnimalTrait::new('meow');
    let cow = AnimalTrait::new('moo');
    assert(cat.make_noise() == 'meow', 'Wrong noise');
    assert(cow.make_noise() == 'moo', 'Wrong noise');
}
