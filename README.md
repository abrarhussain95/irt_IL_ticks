
This R script performs Item Response Theory (IRT) analysis on Knowledge, Attitudes, and Practices (KAP) survey data from multiple stakeholder groups, including Public Health Professionals, Medical Professionals, Veterinary Professionals, Extension Workers, and Farmers.

Main Functions:

Data Preparation:

Loads group-specific response data.

Renames columns and applies scoring logic to generate binary variables (s1, s2, etc.).

Computes total scores for each participant.

IRT Modeling:

Fits Rasch (1PL), 2PL, and 3PL models using R packages like eRm, ltm, and mirt.

Extracts beta values (item difficulty) and normalizes them from 0 to 1 for comparison.

Calculates model fit using AIC and BIC.

Item Analysis:

Plots include:

Normalized beta bar plots

Item Characteristic Curves (ICCs)

Person-Item Maps (Wright Maps)

Proportion Correct Plots

Upper-Lower Index (ULI) plots

Discrimination Index:

Calculates ULI to evaluate each item’s ability to distinguish between low- and high-scoring groups.

Model Comparison:

Compares Rasch, 2PL, and 3PL models using correlation of item difficulties and fit statistics.

Output:

All plots are saved to the "IRT Output" directory as .png or .tif files.

Scored datasets and beta values are saved as CSV and RData files.

Purpose:
This analysis helps evaluate the reliability and discrimination of KAP survey items across different professional groups using standardized IRT methods.
