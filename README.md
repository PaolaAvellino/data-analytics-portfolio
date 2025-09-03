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

## Exercises

Each query is explained using the structure Goal → How it works → Why it’s interesting.

1. Most Prolific Actor/Actress
Goal: Find the actor/actress who appears in the largest number of distinct series.
How it works: Count series per actor (Actuaciones), then look up the actor’s name in Actores.
Why it’s interesting: Highlights the most recurrent talent across the catalog.
👉 View SQL
2. Series with the Highest IMDb Average Rating
Goal: Find the series with the highest average IMDb rating.
How it works: Calculate average rating per series (Episodios), then look up the title in Series.
Why it’s interesting: Shows the overall top-rated show in the catalog.
👉 View SQL
3. Longest Episode
Goal: Find the longest episode by duration.
How it works: Order Episodios by duracion and select the top row.
Why it’s interesting: Long episodes often represent specials or finales.
👉 View SQL
4. Most Prevalent Genres
Goal: Find the most frequent genres in the catalog.
How it works: Group Series by genero and count.
Why it’s interesting: Shows catalog composition and strategy focus.
👉 View SQL
5. Top 3 Series by IMDb Rating and Episode Count
Goal: Find the three series with the highest average IMDb rating and show their episode count.
How it works: Join Series + Episodios, group by series, count episodes, calculate average rating.
Why it’s interesting: Combines both quality (rating) and scope (number of episodes).
👉 View SQL
6. Total Duration of Stranger Things
Goal: Calculate the total runtime of Stranger Things.
How it works: Join Series + Episodios, filter by title, sum durations.
Why it’s interesting: Useful to estimate binge-watching commitment.
👉 View SQL
7. Top 3 Genres with Series Details
Goal: Identify the three most popular genres and list each series title, release year, and average rating.
How it works: First find top 3 genres, then join with Series + Episodios, group by series, compute average rating.
Why it’s interesting: Combines catalog popularity with quality.
👉 View SQL
8. Series Overview (Title, Episode Count, Avg Rating)
Goal: Display each series with total episodes and average IMDb rating.
How it works: Use two CTEs — one for titles (Series), another for counts/ratings (Episodios) — and join them.
Why it’s interesting: Gives a quick health snapshot of each series.
👉 View SQL
🛠️ Tools
SQL (MySQL / SQLite)
GitHub for portfolio documentation
⚠️ Note: Queries use Spanish table/column names, but results are aliased in English for clarity.
