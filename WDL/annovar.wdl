version 1.0
workflow annovar3 {

  File vcffile #vcf input 
  String ref_name #CHM13 GrCH38
  File annovarTAR
  String annovar_protocols
  String annovar_operation
  
call annovarConsensus {
      input:
        input_GATK_vcf = vcffile,
        ref_name = ref_name,
        annovarTAR = annovarTAR, #annovar.latest.tar.gz
        annovar_operation = annovar_operation, #g,r,f,f,f
        annovar_protocols = annovar_protocols #refGene,cytoBand,exac03,avsnp147,dbnsfp30a
  }

  output {
    File annotated_vcf = annovarConsensus.output_annotated_vcf
    File annotated = annovarConsensus.output_annotated_table
  }
}

task annovarConsensus {
  File input_GATK_vcf
  String ref_name
  File annovarTAR
  String annovar_protocols
  String annovar_operation

  command {
   set -eo pipefail
  
   tar -xzvf ${annovarTAR}
  
    perl annovar/table_annovar.pl ${input_GATK_vcf} annovar/humandb/ \
      -buildver ${ref_name} \
      -outfile \
      -remove \
     -protocol ${annovar_protocols} \
     -operation ${annovar_operation} \
      -nastring . -vcfinput
  }

  runtime {
    docker: "perl:5.28.0"
    memory: "4G"
    cpu: "1"
  }

  output {
    File output_annotated_vcf = "${base_file_name}.GATK.${ref_name}_multianno.vcf"
    File output_annotated_table = "${base_file_name}.GATK.${ref_name}_multianno.txt"
  }
}
