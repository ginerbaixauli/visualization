data <- read.csv("C:/Users/Carlos/Desktop/Visualización de datos/A5 - PEC2/pax_corpus_1789_agreements_17-11-19.csv", header = T, encoding = "UTF-8")


# Comprobaciones
length(unique(data$X.U.FEFF.AgreementId))

length(unique(data$Name))

table(data$Region)
unique(data$Region)

table(data$Country)
unique(data$Country)

length(unique(data$Peace.Process))

table(data$Peace.Process.Name)

table(data$Stage)
unique(data$Stage)

length(unique(data$Signed.Date))

table(data$Agreement.Conflict.Level)
unique(data$Agreement.Conflict.Level)

table(data$Conflict.Nature)
unique(data$Conflict.Nature)

table(data$Agreement.Status)
unique(data$Agreement.Status)

length(unique(data$Agreement.Text))


# Preprocesado
data <- data[!data$Conflict.Nature=="Other",]

library(stringr)
data$Country <- str_extract(data$Country, "[^/]+")
data$Country <- gsub("[[:punct:]]", "", data$Country)

# Guardado
library(xlsx)
data <- as.data.frame(data)
write.xlsx(data, "C:/Users/Carlos/Desktop/Visualización de datos/A9 - PEC4/data.xlsx", col.names = T, row.names = F, showNA = F)           
