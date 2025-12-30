# LUAD – Machine Learning Feature Selection

This repository contains a machine learning–based feature selection pipeline for identifying potential **miRNA biomarkers in Lung Adenocarcinoma (LUAD)**.

The project focuses on reducing high-dimensional miRNA expression data into an interpretable and robust feature set using multiple embedded and wrapper-based machine learning methods.

---

## Data

- miRNA expression data derived from TCGA-LUAD datasets  
- Data preprocessing and normalization are performed prior to feature selection  
- Raw and processed datasets are organized under the `data/` directory  

---

## Feature Selection Models

The following machine learning models are used for feature selection:

- LASSO Regression  
- Elastic Net Regression  
- Random Forest  
- Boruta  
- XGBoost  
- LightGBM  
- CatBoost
- Random Forest
- ReliefF
- SVM-RFE

Each method provides an independent ranking or subset of informative miRNAs.

---

## Workflow

1. Data preprocessing and normalization  
2. Feature selection using multiple ML-based methods  
3. Comparison of selected miRNA sets across models  
4. Evaluation of feature stability and consistency  

---

## Code Structure

- `src/`  
  - Preprocessing scripts  
  - Feature selection implementations  
  - Model configurations  

- `notebooks/`  
  - Exploratory analysis  
  - Experimental runs  

---

## Output

- Selected miRNA lists for each feature selection method  
- Model-wise feature importance rankings  
- Summary results for downstream analysis  

Outputs are stored under the `results/` directory.

---

## Aim of the Study

The main objective of this project is to identify a reduced and biologically meaningful miRNA signature that may support diagnostic and prognostic modeling in LUAD, while ensuring reproducibility and methodological transparency.

---

## Notes

- This repository is intended for research and educational purposes.  
- The pipeline is modular and can be extended with additional models or datasets.
- This project is supported by TÜBİTAK 2209-A - Undergraduate Research Projects Support Program
