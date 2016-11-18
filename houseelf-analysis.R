#Analysis to link the elf ear length to the GC content on different house elves individuals
#in order to study their astonishing magical powers

download.file("http://www.datacarpentry.org/semester-biology/data/houseelf-earlength-dna-data.csv","data/houseelf-earlength-dna-data.csv")
houseelf_earlength_dna <- read.csv("data/houseelf-earlength-dna-data.csv", stringsAsFactors = F)

