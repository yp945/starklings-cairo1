// options3.cairo
// Execute `starklings hint options3` or use the `hint` watch subcommand for a hint.


use option::OptionTrait;
use debug::print;
use debug::print_felt;
use array::ArrayTrait;
use traits::Into;

#[derive(Drop)]
struct Student {
    name: felt,
    courses: Array::<Option::<felt>>,
}


fn display_grades(student: @Student, index: usize) {
    // don't mind these lines! They are required when
    // running recursive functions.
    match get_gas() {
        Option::Some(_) => {},
        Option::None(_) => {
            let mut data = ArrayTrait::new();
            data.append('Out of gas');
            panic(data);
        },
    }

    if index == 0_usize {
        let mut msg = ArrayTrait::new();
        msg.append(*student.name);
        msg.append('\'s grades:');
        debug::print(msg);
    }
    if index >= student.courses.len() {
        return ();
    }

    let course = *student.courses.at(index);

     match course {
         Option::Some(x) => print_felt(x),
         Option::None(_) => print_felt('No grade'),
     }
    display_grades(student, index + 1_usize);
}


#[test]
#[available_gas(20000000)]
fn test_all_defined() {
    let mut courses = ArrayTrait::<Option::<felt>>::new();
    courses.append(Option::Some('A'));
    courses.append(Option::Some('B'));
    courses.append(Option::Some('C'));
    courses.append(Option::Some('A'));
    let mut student = Student { name: 'Alice', courses: courses };
    display_grades(@student, 0_usize);
}


#[test]
#[available_gas(20000000)]
fn test_some_empty() {
    let mut courses = ArrayTrait::<Option::<felt>>::new();
    courses.append(Option::Some('A'));
    courses.append(Option::None(()));
    courses.append(Option::Some('B'));
    courses.append(Option::Some('C'));
    courses.append(Option::None(()));
    let mut student = Student { name: 'Bob', courses: courses };
    display_grades(@student, 0_usize);
}


impl OptionFeltDrop of Drop::<Option::<felt>>;
impl OptionFeltCopy of Copy::<Option::<felt>>;
impl OptionArrayDrop of Drop::<Array::<Option::<felt>>>;
