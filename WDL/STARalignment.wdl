workflow STARalignment {
    input {
        File file1
        File file2
        File file3
    }

    call STARalign {
        input:
            ref = file1,
            read1 = file2,
            read2 = file3
    }
    
    output {
        File output = STARalign.outputfile
    }

}

task STARalign {
    input {
        File ref
        File read1
        File read2   
    }

    command <<<
        mkdir ind
        mkdir ind/ecoli #set to the name of interest
        STAR --runMode genomeGenerate --genomeDir ind/ecoli --genomeFastaFiles "~{ref}" #change ind/ecoli
        STAR --genomeDir ind/ecoli --readFilesIn "~{read1}" "~{read2}" 
        samtools view -S -b Aligned.out.sam > sample.bam
        samtools flagstat sample.bam > summary.txt
    >>>
    
    runtime {
        docker : "zkim:latest"
    }

    output {
        File outputfile = "summary.txt"
    }
}
