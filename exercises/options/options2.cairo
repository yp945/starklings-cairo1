// options2.cairo
// Execute `starklings hint options2` or use the `hint` watch subcommand for a hint.


use option::OptionTrait;
use debug::print_felt;

#[test]
fn test_options() {
    let target = 'starklings';
    let optional_some = Option::Some(target);
    let optional_none = Option::<felt>::None(());
    simple_option(optional_some);
    simple_option(optional_none);
}

fn simple_option(optional_target: Option::<felt>) {
    if optional_target.is_some() {
        assert(optional_target.unwrap() == 'starklings', 'err1');
    } else {
        debug::print_felt('option is empty !');
    }

}

impl OptionFeltCopy of Copy::<Option::<felt>>;
