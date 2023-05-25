input_bam=$1

chromosomes=($(samtools view -H "$input_bam" | grep "@SQ" | cut -f 2 | cut -d ':' -f 2))

for chromosome in "${chromosomes[@]}"
do
    output_bam="${chromosome}.bam"
    samtools view -b "$input_bam" "$chromosome" > "$output_bam"
done

