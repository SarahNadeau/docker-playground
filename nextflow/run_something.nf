#!/usr/bin/env nextflow

// Run with caching and overwrite default value like: nextflow run run_something.nf -resume --str Bye

process sayHi {
    output:
        stdout into result1  // 'into' creates a "queue" channel

    params.str = "Hi"

    """
    echo "The 'str' parameter is ${params.str}."
    """
}

// 'it' is a stand-in argument (like 'x') for whatever gets passed to the function
result1.subscribe { println it }

// This process somehow knows about and can use the value of 'str' set in the first process
process writeHi {
    output:
        stdout into result2  // write out stdout into a queue channel for subsequent printing
        file 'output.txt' into result3  // write out str into a file that lives in the work directory

    // This gets written out somewhere deep in the 'work' directory
    """
    echo "We'll write that parameter out to:"
    pwd
    echo ${params.str} > output.txt
    """
}

result2.subscribe { println it }

process useChannel {
    input:
        file hi_statement from result3
    output:
        stdout into result4

    """
    echo 'The file says: '
    cat ${hi_statement}
    """
}

result4.subscribe { println it }