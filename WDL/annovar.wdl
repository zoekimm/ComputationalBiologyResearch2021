version 1.0
workflow annovar3 {

  	input {
      File vcffile 
      String ref 
      File annovarTAR
      String base_file_name
      String annovar_protocols
      String annovar_operation
  	}
  
	call annovar {
      input:
        input_vcf = vcffile,
        ref_name = ref,
        annovarTAR = annovarTAR, 
        base_file_name = base_file_name,
        annovar_operation = annovar_operation, 
        annovar_protocols = annovar_protocols
  	}

    output {
      File annotated_vcf = annovar.output_annotated_vcf
      File annotated = annovar.output_annotated_table
    }
}

task annovar {
	input {
    File input_vcf
    String ref_name
    File annovarTAR
    String base_file_name
    String annovar_protocols
    String annovar_operation
    }

    command <<<
     set -eo pipefail

     tar -xzvf ${annovarTAR}

      perl annovar/table_annovar.pl ${input_vcf} annovar/humandb/ \
      -buildver ${ref_name} \
      -outfile ${base_file_name} \
      -remove \
      -protocol ${annovar_protocols} \
      -operation ${annovar_operation} \
      -nastring . -vcfinput
    >>>

    runtime {
      docker: "perl:5.28.0"
      memory: "4G"
      cpu: "1"
    }

    output {
      File output_annotated_vcf = "${base_file_name}.${ref_name}_multianno.vcf"
      File output_annotated_table = "${base_file_name}.${ref_name}_multianno.txt"
    }
}
