#Analysis to link the elf ear length to the GC content on different house elves individuals
#in order to study their astonishing magical powers

download.file("http://www.datacarpentry.org/semester-biology/data/houseelf-earlength-dna-data.csv","data/houseelf-earlength-dna-data_1.csv")
houseelf_earlength_dna_1 <- read.csv("data/houseelf-earlength-dna-data_1.csv", stringsAsFactors = F) #downloading the first data file

library(stringr)

getGC_content <- function(DNA){
  str_to_upper(DNA)
  Gs <- str_count(DNA, "G")
  Cs <- str_count(DNA, "C")
  gc_content <- (Gs + Cs) / str_length(DNA) * 100
  return(gc_content)
}

ncodes_1 <- nrow(houseelf_earlength_dna_1)
DNA_codes_1 <- houseelf_earlength_dna_1[,3]
DNA_GC_content_1 <- data.frame(gc_content=numeric(length=ncodes_1))


for(n in 1:ncodes_1){
  DNA <- DNA_codes_1[n]
  gc_result <- getGC_content(DNA)
  DNA_GC_content_1[n,1] <- gc_result
}