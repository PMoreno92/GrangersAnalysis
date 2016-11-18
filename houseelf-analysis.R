#Analysis to link the elf ear length to the GC content on different house elves individuals
#in order to study their astonishing magical powers

download.file("http://www.datacarpentry.org/semester-biology/data/houseelf-earlength-dna-data.csv","data/houseelf-earlength-dna-data_1.csv")
houseelf_earlength_dna_1 <- read.csv("data/houseelf-earlength-dna-data_1.csv", stringsAsFactors = F) #downloading the first data file

