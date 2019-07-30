function rustrun --description 'rust compile and run'
    set PROG_NAME '_out'
    rustc $argv[1] -o $PROG_NAME
    eval ./$PROG_NAME $argv[2..-1]
    rm $PROG_NAME
end

