SUBROUTINE style()
!###########################################
!###########################################

CALL add_instruction("<style>")
CALL add_instruction(".small { font: italic 10px sans-serif; }")
CALL add_instruction(".large { font: italic 16px sans-serif; }")
!CALL add_instruction("")
!CALL add_instruction("")
CALL add_instruction("</style>")


END SUBROUTINE style


