module frame

const (
	same_frame                              = 0
	same_locals_1_stack_item_frame          = 64
	reserved                                = 128
	same_locals_1_stack_item_frame_extended = 247
	chop_frame                              = 248
	same_frame_extended                     = 251
	append_frame                            = 252
	full_frame                              = 255

	item_top                                = 0
	item_integer                            = 1
	item_float                              = 2
	item_double                             = 3
	item_long                               = 4
	item_null                               = 5
	item_uninitialized_this                 = 6
	item_object                             = 7
	item_uninitialized                      = 8

	item_asm_boolean                        = 9
	item_asm_byte                           = 10
	item_asm_char                           = 11
	item_asm_short                          = 12

	dim_size                                = 6
	kind_size                               = 4
	flags_size                              = 2
	value_size                              = 32 - dim_size - kind_size - flags_size

	dim_shift                               = kind_size + flags_size + value_size
	kind_shift                              = flags_size + value_size
	flags_shift                             = value_size

	dim_mask                                = ((1 << dim_size) - 1) << dim_shift
	kind_mask                               = ((1 << kind_size) - 1) << kind_shift
	value_mask                              = (1 << value_size) - 1

	array_of                                = 1 << dim_shift

	element_of                              = -1 << dim_shift

	constant_kind                           = 1 << kind_shift
	reference_kind                          = 2 << kind_shift
	uninitialized_kind                      = 3 << kind_shift
	local_kind                              = 4 << kind_shift
	stack_kind                              = 5 << kind_shift

	top_if_long_or_double_flag              = 1 << flags_shift

	top                                     = constant_kind | item_top
	boolean                                 = constant_kind | item_asm_boolean
	@byte                                   = constant_kind | item_asm_byte
	char                                    = constant_kind | item_asm_char
	short                                   = constant_kind | item_asm_short
	integer                                 = constant_kind | item_integer
	float                                   = constant_kind | item_float
	long                                    = constant_kind | item_long
	double                                  = constant_kind | item_double
	null                                    = constant_kind | item_null
	uninitialized_this                      = constant_kind | item_uninitialized_this
)
