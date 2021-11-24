version 1.0 
workflow sam2bam {

    input {
    File input1
    }
    
    call convert { 
        input:
        samfile = input1
    }
    
    output {
        File outputfile = map.bamfile
    }
}

task convert {

    input {
    File samfile 
    }

    command <<<
    samtools view -S -b "~{samfile}" > sample.bam
    >>>

    runtime {
    docker : "cbredocker:latest"
    }

    output {
    File bamfile = "sample.bam"
    } 
}


