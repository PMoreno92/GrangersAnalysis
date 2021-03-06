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

get_ear_length <- function(seq){
    #Determine the ear length category
    ear_lengths <- ifelse(seq > 10, "large", "small")
    return(ear_lengths)
}

ncodes_1 <- nrow(houseelf_earlength_dna_1)
DNA_codes_1 <- houseelf_earlength_dna_1[,3]
DNA_GC_content_1 <- data.frame(id=numeric(length=ncodes_1), earlength_class=numeric(length=ncodes_1), gc_content=numeric(length=ncodes_1))


for(n in 1:ncodes_1){
  id <- houseelf_earlength_dna_1[n,1]
  earlength <- houseelf_earlength_dna_1[n,2]
  earlength_class <- get_ear_length(earlength)
  DNA <- DNA_codes_1[n]
  gc_result <- getGC_content(DNA)
  DNA_GC_content_1[n,1] <- id
  DNA_GC_content_1[n,2] <- earlength_class
  DNA_GC_content_1[n,3] <- gc_result
}
