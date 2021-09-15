module vjvm

struct Label {
pub mut:
	info            voidptr
	flags           i16
	bytecode_offset int

	input_stack_size  i16
	output_stack_size i16
	output_stack_max  i16
	subroutine_id     i16
mut:
	line_number        i16
	other_line_numbers []int
	forward_references []int
}
