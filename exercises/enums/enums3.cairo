// enums3.cairo
// Address all the TODOs to make the tests pass!
// Execute `starklings hint enums3` or use the `hint` watch subcommand for a hint.


#[derive(Drop, Copy)]
enum Message { // TODO: implement the message variant types based on their usage below
    Quit: (),
    Move: Point,
    Echo: felt,
    ChangeColor: ((u8, u8, u8)),
}

#[derive(Drop, Copy)]
struct Point {
    x: u8,
    y: u8,
}

#[derive(Copy)]
struct State {
    color: (u8, u8, u8),
    position: Point,
    quit: bool,
}

trait StateTrait {
    fn change_color(ref self: State, new_color: (u8, u8, u8));
    fn quit(ref self: State);
    fn echo(ref self: State, s: felt);
    fn move_position(ref self: State, p: Point);
    fn process(ref self: State, message: Message);
}
impl StateImpl of StateTrait {
    fn change_color(ref self: State, new_color: (u8, u8, u8)) {
        let State{color, position, quit, } = self;
        self = State { color: new_color, position: position, quit: quit,  };
    }
    fn quit(ref self: State) {
        let State{color, position, quit, } = self;
        self = State { color: color, position: position, quit: true,  };
    }

    fn echo(ref self: State, s: felt) {
        debug::print_felt(s);
    }

    fn move_position(ref self: State, p: Point) {
        let State{color, position, quit, } = self;
        self = State { color: color, position: p, quit: quit,  };
    }

    fn process(
        ref self: State, message: Message
    ) {
        match message {
            Message::Quit(()) => self.quit(),
            Message::Move(Point {x, y}) => self.move_position(Point {x, y}),
            Message::Echo(msg) => self.echo(msg),
            Message::ChangeColor((r, g, b)) => self.change_color((r, g, b)),
        }
    }
}


#[test]
fn test_match_message_call() {
    let mut state = State {
        quit: false, position: Point { x: 0_u8, y: 0_u8 }, color: (0_u8, 0_u8, 0_u8), 
    };
    state.process(Message::ChangeColor((255_u8, 0_u8, 255_u8)));
    state.process(Message::Echo('hello world'));
    state.process(Message::Move(Point { x: 10_u8, y: 15_u8 }));
    state.process(Message::Quit(()));

    assert(state.color == (255_u8, 0_u8, 255_u8), 'wrong color');
    assert(state.position.x == 10_u8, 'wrong x position');
    assert(state.position.y == 15_u8, 'wrong y position');
    assert(state.quit == true, 'quit should be true');
}


impl TripleTuplePartialEq of PartialEq::<(u8, u8, u8)> {
    #[inline(always)]
    fn eq(a: (u8, u8, u8), b: (u8, u8, u8)) -> bool {
        let (a0, a1, a2) = a;
        let (b0, b1, b2) = b;
        a0 == b0 & a1 == b1 & a2 == b2
    }
    #[inline(always)]
    fn ne(a: (u8, u8, u8), b: (u8, u8, u8)) -> bool {
        !(a == b)
    }
}
