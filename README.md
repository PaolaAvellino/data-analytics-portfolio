Hi there! 👋 

I'm **Paola Avellino**, currently pursuing a Master's in Artificial Intelligence & Data Science, with a strong interest in turning raw data into valuable insights. I'm building this portfolio to showcase what I'm learning and how I apply it through real-world projects.

Even though I'm transitioning from a background in international business and customs analysis, I bring a sharp analytical mindset, a love for problem-solving, and growing skills in tools like Python, SQL, Power BI, and R.

---

## E-Commerce Sales Dashboard – Olist (Power BI)

This Power BI dashboard provides a high-level overview of sales performance from a real-world Brazilian e-commerce company (Olist). 

It showcases my skills in data modeling, DAX, visualization, and storytelling with business data.

### 🔍 Dashboard Highlights

- 💰 **Revenue:** $15.8M  
- 📦 **Total Orders:** 99.4K  
- 🧑‍💼 **Unique Clients:** 96.1K  
- 📈 **Average Order Value:** $159.3

### Visual Insights

- **Sales by State (Map):** Revenue distribution by State
- **Top Categories by Sales:** Watches & gifts, toys, telephony  
- **Revenue Over Time:** Trend analysis from 2016 to 2018

### 📁 Data Source
- [Olist E-commerce Dataset on Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)

### 🛠️ Tools Used
- Power BI
- DAX 
- Data modeling

---

## Netflix SQL Portfolio

This repository contains a series of SQL practice exercises using a sample database of Netflix series.

The database itself is in Spanish, but all queries include English documentation and output aliases for consistency.


| Spanish Table/Column | English Equivalent                                         |
| -------------------- | ---------------------------------------------------------- |
| Actores              | Actors (`actor_id`,`nombre`, `fecha_nacimiento`)                              |
| Series               | Series (`serie_id`, `titulo`, `año_lanzamiento`, `genero`, `descripcion`) |
| Episodios            | Episodes (`serie_id`, `episodio_id`,`titulo`, `duracion`, `rating_imdb`, `temporada`, `descripcion`, `fecha_estreno`)        |
| Actuaciones          | Performances (`actor_id`,`serie_id`, `personaje`)              |

**Exercises**

👉 All queries are in [Netflix SQL Portfolio](https://github.com/PaolaAvellino/data-analytics-portfolio/blob/main/Netflix%20SQL%20Portfolio.sql) with full explanations.  

Each query is explained using the structure Goal → How it works → Why it’s interesting.

**1. Most prolific actor/actress.**

**2. Series with the highest IMDb average rating.**

**3. Longest episode.**

**4. Most prevalent genres.**

**5. Top 3 series by IMDb rating and episode count.**

**6. Total duration of *Stranger Things*.**

**7. Top 3 genres with series details.**

**8. Series overview (title, episode count, avg rating).**

---

## Lending Club Case Study

About this Project

This case study is based on a real-world dataset (Lending Club). The goal was not to build a perfectly polished example, but to showcase a realistic workflow where challenges naturally arise during data preparation and modeling.

Throughout the process, I encountered issues such as missing values, incorrect data types, and categorical variables requiring transformation. Instead of hiding these obstacles, I documented how I addressed them step by step until reaching a working solution.

This approach reflects the way real projects evolve: data is often messy, decisions must be made iteratively, and the final model is the result of problem-solving along the way.

**Dataset** 

The dataset used in this project was provided as part of my Master’s program.
Due to size and sharing restrictions, the full dataset is not included in this repository.
However, the project can be reproduced using publicly available versions of the Lending Club dataset (e.g., on Kaggle).

**Project Workflow** 

1. Data Cleaning & Preprocessing
   
- Removed irrelevant or post-loan variables.
- Handled missing values using imputation strategies.
- Converted categorical variables into numeric dummy variables.
- Transformed variables such as interest rate (int_rate), revolving utilization (revol_util), and employment length (emp_length).
- Evaluated variable relevance using Information Value (IV).

2. Feature Selection

- Discarded variables with very low predictive power (IV < 0.1).
- Removed overly predictive variables (IV > 0.5) to reduce bias.
- Retained variables with medium discriminative power (0.1 ≤ IV ≤ 0.5).

3. Modeling
   
- Trained and evaluated several classification models to predict loan status (Fully Paid vs. Default):
- Logistic Regression
- Decision Tree
- Random Forest
- XGBoost

4. Evaluation Metrics

- Models were compared using the following metrics:
- Accuracy
- Precision
- Recall
- F1-score
- AUC-ROC
- Gini Index
  
**Results**

| Model               | AUC-ROC | Gini  | Accuracy | Precision | Recall | F1-score |
|----------------------|---------|-------|----------|-----------|--------|----------|
| Logistic Regression  | 0.5142  | 0.0283| 0.8045   | 0.8060    | 0.9970 | 0.8914   |
| Decision Tree        | 0.6598  | 0.3197| 0.6949   | 0.8608    | 0.7406 | 0.7961   |
| Random Forest        | 0.7275  | 0.4550| 0.7574   | 0.8605    | 0.8337 | 0.8469   |
| XGBoost              | 0.7285  | 0.4571| 0.7155   | 0.8737    | 0.7556 | 0.8104   |


**Insights**

- Logistic Regression performed poorly, with an almost random discriminative capacity.

- Decision Tree improved over Logistic Regression but still struggled with misclassifying many negative cases.

- Random Forest delivered strong predictive power, balancing precision and recall effectively.

- XGBoost achieved the best overall performance, with the highest AUC-ROC and Gini Index, making it the most robust model in this study.



