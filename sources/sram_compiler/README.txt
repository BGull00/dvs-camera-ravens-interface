Only modify the "array_compiler.sh" script variables.
In particular, the "NROWS", "NCOLS", and "WRDSZ" are probably what you want to change.

You can also change the "LIB_NAME" and "OUTPUT_LIB_LIB_NAME" variables as well. The 
latter is only relevant when "COPY_TO_OUTPUT" is 1, especially when "USE_OUTPUT_DIR_LIB"
is also set to 1.

Do not modify any of the source files unless you *really* know what's going on, 
as it can break the wrapper script, compilation outputs, and even compilation itself.
