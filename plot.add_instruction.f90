SUBROUTINE add_instruction(instruction)
!###########################################
CHARACTER(LEN=*) :: instruction
INTEGER(kind=StandardInteger) :: ins_len
!###########################################
CALL line_length(instruction, ins_len)
svg_lines = svg_lines + 1
svg_data(svg_lines)(1:ins_len) = instruction(1:ins_len) 
END SUBROUTINE add_instruction