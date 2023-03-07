// options1.cairo
// Execute `starklings hint options1` or use the `hint` watch subcommand for a hint.

use option::OptionTrait;

// This function returns how much icecream there is left in the fridge.
// If it's before 10PM, there's 5 pieces left. At 10PM, someone eats them
// all, so there'll be no more left :(
fn maybe_icecream(time_of_day: felt) -> Option::<felt> {
        if time_of_day < 22 {
            Option::Some(5)
        } else if time_of_day < 24 {
            Option::Some(0)
        } else {
            Option::None(())
        }
}


#[test]
fn check_icecream() {
    assert(maybe_icecream(9).unwrap() == 5, 'err_1');
    assert(maybe_icecream(10).unwrap() == 5, 'err_2');
    assert(maybe_icecream(23).unwrap() == 0, 'err_3');
    assert(maybe_icecream(22).unwrap() == 0, 'err_4');
    assert(maybe_icecream(25).is_none(), 'err_5');
}

#[test]
fn raw_value() {
    // TODO: Fix this test. How do you get at the value contained in the Option?
    let icecreams = maybe_icecream(12).unwrap();
    assert(icecreams == 5, 'err_6');
}

impl OptionFeltDrop of Drop::<Option::<felt>>;
