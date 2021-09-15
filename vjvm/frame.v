module vjvm

struct Frame {
pub mut:
	owner &Label [required]
mut:
	input_locals         []int
	input_stack          []int
	output_locals        []int
	output_stack         []int
	output_stack_start   []i16
	output_stack_top     []i16
	initialization_count int
	initializations      []int
}

// copy values from given frame, you may want to discard given frame to avoid unforeseen side effects
pub fn (mut f Frame) copy_from(f2 Frame) {
	f.input_locals = f2.input_locals
	f.input_stack = f2.input_stack
	f.output_locals = f2.output_locals
	f.output_stack = f2.output_stack
	f.output_stack_start = 0
	f.output_stack_top = f2.output_stack_top
	f.initialization_count = f2.initialization_count
	f.initializations = f.initializations
}

// pub fn get_abstract_type_from_api_format(st SymbolTable, @type voidptr) int {

// }


// pub fn get_abstract_type_from_internal_name(st SymbolTable, internal_name string) int {

// }

// fn get_abstract_type_from_descriptor(st SymbolTable, buffer string, offset int) int {

// }
