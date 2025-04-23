# 🏅 120 Years of Olympics History – SQL Project

This project analyzes over a century of Olympic Games data using SQL. The aim is to uncover insights about medal distribution, player achievements, and national performances using historical records from both Summer and Winter Olympic events.

---

### 📌 Problem Statement

The International Olympic Committee and sports analysts want to explore patterns from over 120 years of Olympic history. They aim to:

- Analyze medal performance by country and players
- Identify top contributors by season, sport, and event
- Track the first-ever medal achievements for specific countries
- Detect rare milestones like players winning across Summer and Winter games

This project answers a series of analytical questions using SQL on data imported from historical Olympic records.

---

### 🎯 Project Goals

- Identify which **team** has won the most **gold medals**
- For each **team**, display **total silver medals** and the **year** with their peak silver wins
- Detect players who only won **gold medals** and rank them by count
- Track **year-wise top gold medalists**, including ties
- Find the **first medal (gold/silver/bronze)** won by India
- Identify players who won **gold medals in both Summer and Winter Olympics**
- Detect players who won **all 3 medals** (Gold, Silver, Bronze) in a single Olympic year
- Spot players who won **gold in the same event** across **three consecutive Summer Olympics** (2000 onward)

---

### 🧾 Dataset Description

Two CSV files were used in this project:

#### 1. `athletes.csv`
Contains basic information about Olympic athletes.

| Column Name | Description                          |
|-------------|--------------------------------------|
| id          | Unique athlete ID                    |
| name        | Full name of the athlete             |
| sex         | Gender (M/F)                         |
| height      | Height in cm                         |
| weight      | Weight in kg                         |
| team        | Team or country represented          |

#### 2. `events.csv`
Contains event-wise data over 120+ years.

| Column Name   | Description                                   |
|---------------|-----------------------------------------------|
| athlete_id    | ID linked to `athletes.id`                    |
| games         | Edition of the Olympic Games                  |
| year          | Year of the event                             |
| season        | Season (Summer/Winter)                        |
| city          | Host city                                     |
| sport         | Sport type (e.g., Judo, Swimming)             |
| event         | Specific event (e.g., Men's 100m Freestyle)   |
| medal         | Medal won (Gold/Silver/Bronze/NA)             |

#### 🧪 Sample Rows:

**From `athletes.csv`:**
| id | name                    | sex | height | weight | team           |
|----|-------------------------|-----|--------|--------|----------------|
| 1  | A Dijiang               | M   | 180    | 80     | China          |

**From `athlete_events..csv`:**
| athlete_id | year | season | city     | sport       | event                  | medal |
|------------|------|--------|----------|-------------|------------------------|--------|
| 1          | 1992 | Summer | Barcelona| Basketball  | Men's Basketball       | NA     |

---

### 📥 Data Import Process

Both CSVs were imported into SQL Server using:
- SSMS → **Tasks > Import Flat File Wizard**
- Ensured `athlete_id` in `events` table matches `id` in `athletes`
- Cleaned nulls and standardized medal fields (`NA` → `NULL`, case consistency)

Tables created:
- `athletes`
- `events`

---

### 📌 Key Insights

- The team with the most **gold medals** across Olympics history was successfully identified
- Every team's **silver medal history** was analyzed with the peak silver year flagged
- Players who **only won gold** and never silver/bronze were filtered and ranked
- **Top gold winners** per year were aggregated, including tied results using `STRING_AGG()`
- India's **first gold, silver, and bronze** medals were discovered by year and event
- A rare list of players who **won gold in both Summer and Winter Olympics** was extracted
- Multi-medal champions (Gold, Silver, Bronze in a single year) were identified
- Athletes who won **gold in the same event** in **3 consecutive Summer Olympics since 2000** were also found

---

### 📁 Folder Structure

| File Name                                | Description                                                            |
|------------------------------------------|------------------------------------------------------------------------|
| `athlete_events.CSV`                     | Data file                                                              |
| `athletes_CSV`                           | Data file                                                              |
| `question_01_team_max_gold.sql`          | Team with the most gold medals                                         |
| `question_02_silver_peak_year.sql`       | Silver medal analysis by team and peak year                            |
| `question_03_gold_only_players.sql`      | Players who won only gold, never silver or bronze                      |
| `question_04_top_gold_yearly.sql`        | Year-wise top gold medalist(s)                                         |
| `question_05_india_first_medals.sql`     | India's first medal wins (gold, silver, bronze)                        |
| `question_06_summer_winter_champions.sql`| Players who won gold in both Summer and Winter Olympics                |
| `question_07_all_medals_single_year.sql` | Players who won all three medals in a single year                      |
| `question_08_consecutive_gold_winners.sql`| Players who won gold in same event across 3 consecutive Summer Olympics |
| `README.md`                              | Project overview and documentation                                     |

---

### ✅ How to Use

1. Clone this repository
2. Open SQL Server Management Studio (SSMS)
3. Import CSVs using Flat File Wizard or scripts
4. Run query files individually to generate insights

---

### 👨‍💻 Author

**Madhu K**  
Data Analyst | SQL Developer | Power BI Enthusiast  
📬 [LinkedIn](#)  
🌐 [Portfolio Website](#) *(optional)*

---

### ⭐️ Support

If you found this useful:
- 🌟 Star the repo
- 🍴 Fork and explore other angles (e.g., gender insights, city trends)
- 📧 Reach out for feedback or collaboration!
