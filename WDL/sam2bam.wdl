workflow sam2bam {
    input {
        File samfile
    }

    call STARalign {
        input:
            sam = samfile
    }
    
    output {
        File output = tobam.bamfile
    }

}

task tobam {
    input {
        File sam
    }

    command <<<
		samtools view -S -b "~{sam}" > sample.bam
    >>>
    
    runtime {
        docker : "cbredocker:latest"
    }

    output {
        File bamfile = "sample.bam"
    }
}
