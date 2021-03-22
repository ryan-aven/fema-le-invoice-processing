library(readxl)
X03222021_le_weekly <- read_excel("C:/Users/raven/OneDrive - FEMA/Desktop/L&E Weekly Report/Sample Report/03222021_le_weekly.xlsx")
View(X03152021_le_weekly)

library(ggplot2)
library(tidyr)
library(dplyr)
library(unikn)
remaining_invoices <- ggplot(X03222021_le_weekly, aes(x=Week, y = Remaining, group=1)) + 
  geom_line(color = "dodgerblue4", size=1) +
  geom_point(color = "dodgerblue4", size =1.25) + 
  geom_text(aes(label=Remaining), size=3.5, vjust=-1.1)+
  ggtitle("Total Remaining Invoices") +
  xlab("Week") +
  ylab("Remaining Invoices") +
  scale_y_continuous(limits = c(2900,4200, by =100),
                     breaks = seq(0,5000, 250))+
  theme_minimal()
  
remaining_invoices
  
new_invoices <- ggplot(X03222021_le_weekly, aes(x=Week, y = `Submitted Last Week`, group=1)) + 
  geom_line(color = "grey47", size=1) +
  geom_point(color = "grey47", size =1.25) + 
  geom_text(aes(label=`Submitted Last Week`), size=3.5, vjust=-1.1)+
  ggtitle("New Invoices, by Week") +
  xlab("Week") +
  ylab("New Invoices") +
  scale_y_continuous(limits = c(0,250, by =15),
                     breaks = seq(0,5000, 50))+
theme_minimal()

new_invoices

completed_invoices <- ggplot(X03222021_le_weekly, aes(x=Week, y = `Completed Last Week`, group=1)) + 
  geom_line(color = "darkorange1", size=1) +
  geom_point(color = "darkorange1", size =1.25) + 
  geom_text(aes(label=`Completed Last Week`), size=3.5, vjust=-1.1)+
  ggtitle("Completed Invoices, by Week") +
  xlab("Week") +
  ylab("Completed Invoices") +
  scale_y_continuous(limits = c(0,250, by =15),
    breaks = seq(0,5000, 50))+
theme_minimal()

completed_invoices

library(gridExtra)
library(ggpubr)

#making a list of plots
plots <- list(completed_invoices, new_invoices, remaining_invoices)

#arranging the three plots on one pdf
ggarrange(completed_invoices, new_invoices, remaining_invoices,
          ncol=2, nrow = 2)
