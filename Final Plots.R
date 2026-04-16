---
title: "Final Plot"
author: "Abrar"
date: "`r Sys.Date()`"
output: html_document
---


## Knowledge Questions Plot


# Load required libraries
library(tidyverse)
library(dplyr)

# Read the CSV file
file_path <- "C:/Users/abrar/OneDrive - University of Illinois - Urbana/Documents/Abrar Hussain/Ph.D/Ph.D. Papers/As Authors/KAP (Metanalysis)/Qualitative Part/Selected Question Responses for IRT/CSV/Beta and ULI/knowledge_beta_and_uli.csv"

df <- read_csv(file_path)

# Select needed columns only
df_clean <- dplyr::select(df, -ID, -Question_lable)

# Reshape
df_long <- df_clean %>%
  pivot_longer(
    cols = -c(Label, Questions, Questions_full),
    names_to = "Variable",
    values_to = "Value"
  ) %>%
  mutate(
    Metric = ifelse(str_detect(Variable, "beta"), "Beta", "ULI"),
    Group = str_remove(Variable, "_beta|_uli")
  ) %>%
  filter(!is.na(Value))

df_long$Label <- factor(df_long$Label, levels = c("K1", "K2", "K3", "K4", "K5", "K6", "K7", 
                                                  "K8", "K9", "K10", "K11", "K12", "K13", 
                                                  "K14", "K15", "K16", "K17", "K18", "K19", 
                                                  "K20", "K21", "K22", "K23","K24", "K25", 
                                                  "K26", "K27", "K28","K29"))

p1 <- ggplot(df_long, aes(x = Label, y = Value, fill = Metric)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.7)) +
  facet_wrap(~ Group, ncol = 1) +
  scale_fill_manual(values = c("Beta" = "#B2182B", "ULI" = "#737373")) +
  labs(
    x = "Knowledge Questions (Labeled)",
    y = "Value",
    fill = "Metric"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    panel.grid = element_blank(),
    panel.background = element_rect(fill = "white"),
    plot.background = element_rect(fill = "white"),
    axis.line = element_line(color = "black"),
    axis.text.x = element_text(angle = 45, hjust = 1, size = 10),
    strip.background = element_rect(fill = "gray90", color = NA),
    strip.text = element_text(face = "bold", size = 16)
  )



print(p1)

setwd("C:/Users/abrar/OneDrive - University of Illinois - Urbana/Documents/Abrar Hussain/Ph.D/Ph.D. Papers/As Authors/KAP (Metanalysis)/Qualitative Part/IRT Analysis/Output")

# Step 3: Save
ggsave(
  filename = "Knowledge.png",
  plot = p1,
  width = 14, height = 8, dpi = 300, units = "in",
  bg = "white"
)





## Parctice Questions Plot


# Load required libraries
library(tidyverse)
library(dplyr)

# Read the CSV file
file_path <- "C:/Users/abrar/OneDrive - University of Illinois - Urbana/Documents/Abrar Hussain/Ph.D/Ph.D. Papers/As Authors/KAP (Metanalysis)/Qualitative Part/Selected Question Responses for IRT/CSV/Beta and ULI/practices_beta_and_uli.csv"
df <- read_csv(file_path)

# Select needed columns only
df_clean <- dplyr::select(df, -ID, -Question_lable)

# Reshape
df_long <- df_clean %>%
  pivot_longer(
    cols = -c(Label, Questions, Questions_full),
    names_to = "Variable",
    values_to = "Value"
  ) %>%
  mutate(
    Metric = ifelse(str_detect(Variable, "beta"), "Beta", "ULI"),
    Group = str_remove(Variable, "_beta|_uli")
  ) %>%
  filter(!is.na(Value))

df_long$Label <- factor(df_long$Label, levels = c("P1", "P2", "P3", "P4", "P5", "P6", "P7", 
                                                  "P8", "P9", "P10"))

p2 <- ggplot(df_long, aes(x = Label, y = Value, fill = Metric)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.7)) +
  facet_wrap(~ Group, ncol = 1) +
  scale_fill_manual(values = c("Beta" = "#B2182B", "ULI" = "#737373")) +
  labs(
    x = "Practices Questions (Labeled)",
    y = "Value",
    fill = "Metric"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    panel.grid = element_blank(),
    panel.background = element_rect(fill = "white"),
    plot.background = element_rect(fill = "white"),
    axis.line = element_line(color = "black"),
    axis.text.x = element_text(angle = 45, hjust = 1, size = 10),
    strip.background = element_rect(fill = "gray90", color = NA),
    strip.text = element_text(face = "bold", , size = 16)
  )


print(p2)


setwd("C:/Users/abrar/OneDrive - University of Illinois - Urbana/Documents/Abrar Hussain/Ph.D/Ph.D. Papers/As Authors/KAP (Metanalysis)/Qualitative Part/IRT Analysis/Output")


#Save
ggsave(
  filename = "Parctices.png",
  plot = p2,
  width = 14, height = 8, dpi = 300, units = "in",
  bg = "white"
)



