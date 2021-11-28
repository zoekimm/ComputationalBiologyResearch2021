version 1.0
workflow bwamem {
    input {
        File ref
        File read1
        File read2
        String dockerImage
    }

    call bwamemalign {
        input:
            ref = ref,
            read1 = read1,
            read2 = read2,
            dockerImage = dockerImage
    }
    
    output {
        File samfile = bwamemalign.samfile
        File bamfile = bwamemalign.bamfile
        File resultfile = bwamemalign.resultfile
    }

}

task bwamemalign {
    input {
        File ref
        File read1
        File read2
        String dockerImage 
    }

    command <<<
        bwa-mem2 mem "~{ref}" "~{read1}" "~{read2}" > sample.sam
        samtools view -S -b sample.sam > sample.bam
        samtools flagstat sample.bam > result.txt
    >>>
    
    runtime {
        docker : dockerImage
    }

    output {
        File samfile = "sample.sam"
        File bamfile = "sample.bam"
        File resultfile = "result.txt"
    }
}
