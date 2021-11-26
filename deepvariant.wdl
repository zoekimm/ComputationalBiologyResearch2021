version 1.0 
workflow deepvaraint {

    input {
        File reffile
        #File fastafile
        File bamfile
        #File baifile
        String outputfilename
    }
    
    call run_dv { 
        input:
            inputref = reffile,
            #inputfasta = fastafile,
            inputbam = bamfile,
            #inputbai = baifile,
            vcffile = outputfilename
    }
    
    output {
        File outputfile = run_dv.outputfile
    }
}

task run_dv {

    input {
    File inputref
    #File inputfasta
    File inputbam
    #File inputbai
    String vcffile
    }

    command <<<
        set -e
        /opt/deepvariant/bin/run_deepvariant \
        --ref "~{inputref}" \
        --reads "~{inputbam}" \
        --model_type=WES \
        --output_vcf=/output/"~{vcffile}" \ #output.vcf.gz
        #--output_gvcf=/output/output.g.vcf.gz  \ #output.vcf.gz
    >>>

    runtime {
        docker : "mkim55/deep-variant:latest"
    }

    output {
        File outputfile = vcffile
    } 
}


