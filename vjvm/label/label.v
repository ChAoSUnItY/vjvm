module label

import vjvm

const (
	flag_debug_only                       = 1
	flag_jump_target                      = 2
	flag_resolved                         = 4
	flag_reachable                        = 8
	flag_subroutine_caller                = 16
	flag_subroutine_start                 = 32
	flag_subroutine_end                   = 64
	line_numbers_capacity_increment       = 4
	forward_references_capacity_increment = 6
	forward_reference_type_mask           = 0xF0000000
	forward_reference_type_short          = 0x10000000
	forward_reference_type_wide           = 0x20000000
	forward_reference_handle_mask         = 0x0FFFFFFF
)
