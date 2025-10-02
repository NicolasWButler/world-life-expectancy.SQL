# 🌍 World Life Expectancy Project (SQL)

📊 **Project Overview**  
This project explores **world life expectancy data** using **MySQL**.  
It includes **data cleaning** steps to prepare the dataset and  
**exploratory analysis** to answer key questions about life expectancy trends, GDP, country status (Developed vs Developing), BMI, and adult mortality.  

The project demonstrates SQL skills in:  
- Cleaning and standardising raw data  
- Query design for descriptive and comparative analysis  
- Using window functions for cumulative metrics  
- Exporting results for interpretation  
- Linking insights to global health and development context  

---

## 🔧 Project Structure
- `World_Life_Expectancy_Data.Cleaning.Project.sql` → Cleaning script (deduplication, imputing missing values, adjacent-year interpolation).  
- `World_Life_Expectancy_Exploratory_Analysis_Project.sql` → Exploratory analysis queries answering 6 research questions.  
- `World_Life_Expectancy_Table.csv` → Source dataset (raw table).  
- `results/` (CSV exports, browsable directly on GitHub):  
  - [`life-expectancy_change-15yr_by-country.csv`](./life-expectancy_change-15yr_by-country.csv)  
  - [`life-expectancy_global_annual-average.csv`](./life-expectancy_global_annual-average.csv)  
  - [`country_life-expectancy_and_gdp_averages.csv`](./country_life-expectancy_and_gdp_averages.csv)  
  - [`life-expectancy_by-gdp-bucket_threshold1500.csv`](./life-expectancy_by-gdp-bucket_threshold1500.csv)  
  - [`life-expectancy_avg_by-status.csv`](./life-expectancy_avg_by-status.csv)  
  - [`country_counts_by-status_with-avg-life-expectancy.csv`](./country_counts_by-status_with-avg-life-expectancy.csv)  
  - [`country_life-expectancy_and_bmi_averages.csv`](./country_life-expectancy_and_bmi_averages.csv)  
  - [`adult-mortality_rolling-total_by-country_and_year.csv`](./adult-mortality_rolling-total_by-country_and_year.csv)  

---

## ❓ Key Questions & Findings

### 1. How much has life expectancy improved by country over time?
- **Finding:** By calculating the minimum and maximum life expectancy for each country, we can see which countries achieved the largest gains over the dataset period. Many nations show **double-digit improvements** over the span of roughly 15 years, reflecting advances in healthcare, economic growth, and social development.  
  - Example: Emerging economies in Asia and Africa saw improvements of **10+ years**, while more developed nations improved at a slower rate (already near the global maximum).  
  - At the other end, a handful of countries show **minimal progress** due to persistent conflict, poor healthcare infrastructure, or disease burden.  

📂 File:  
- [`life-expectancy_change-15yr_by-country.csv`](./life-expectancy_change-15yr_by-country.csv)  

---

### 2. What is the global life expectancy trend year by year?
- **Finding:** Global average life expectancy increases steadily across the years captured in this dataset. The trend reflects **consistent global progress** in healthcare access, vaccines, sanitation, and poverty reduction.  
  - The world average rises by several years over the dataset window, showing that even incremental improvements compound into substantial gains at the global level.  
  - Smaller dips or plateaus can signal the impact of **localised crises** (wars, epidemics, or economic downturns).  

📂 File:  
- [`life-expectancy_global_annual-average.csv`](./life-expectancy_global_annual-average.csv)  

---

### 3. How does GDP relate to life expectancy?
- **Finding:**  
  - **By country averages:** There is a strong positive relationship between a country’s wealth (GDP) and its life expectancy. Nations with higher average GDP — such as those in Western Europe and parts of East Asia — also tend to have higher average life expectancy.  
  - **By GDP buckets (≥1500 vs <1500):** Splitting the dataset into high- vs low-GDP groups confirms the pattern. The **High-GDP group** shows average life expectancy several years higher than the **Low-GDP group**, emphasising the role of economic resources in extending life.  
  - **Outliers:** Some resource-rich countries with relatively high GDP per capita do not achieve the life expectancy levels of peers due to inequality, governance challenges, or public health issues.  

📂 Files:  
- [`country_life-expectancy_and_gdp_averages.csv`](./country_life-expectancy_and_gdp_averages.csv)  
- [`life-expectancy_by-gdp-bucket_threshold1500.csv`](./life-expectancy_by-gdp-bucket_threshold1500.csv)  

---

### 4. Do “Developed” vs “Developing” countries differ in life expectancy?
- **Finding:** A clear gap exists between **Developed** and **Developing** countries.  
  - Developed countries consistently report **average life expectancies in the high 70s or 80s**, reflecting strong healthcare systems, better nutrition, and lower infant mortality.  
  - Developing countries average significantly lower, sometimes in the **50s or 60s**, due to systemic challenges.  
  - Counting countries by status also shows the dataset skews towards more Developing entries, meaning much of the world still faces barriers to catching up.  
  - This highlights not just the gap, but also the **scale of inequality** in global health.  

📂 Files:  
- [`life-expectancy_avg_by-status.csv`](./life-expectancy_avg_by-status.csv)  
- [`country_counts_by-status_with-avg-life-expectancy.csv`](./country_counts_by-status_with-avg-life-expectancy.csv)  

---

### 5. Is there a relationship between BMI and life expectancy?
- **Finding:** The analysis suggests a **positive association** between BMI and life expectancy at the country level.  
  - Nations with higher average BMI often report higher life expectancy.  
  - In developed economies, higher BMI reflects **calorie availability and food security** — correlating with improved survival rates.  
  - Conversely, lower-BMI countries often overlap with lower-income nations, where **malnutrition contributes to shorter lifespans**.  
  - It is descriptive, not causal — beyond a certain point, very high BMI is associated with health risks.  

📂 File:  
- [`country_life-expectancy_and_bmi_averages.csv`](./country_life-expectancy_and_bmi_averages.csv)  

---

### 6. How has adult mortality accumulated across countries over time?
- **Finding:** The rolling (cumulative) totals of adult mortality provide a **long-term picture of health challenges**.  
  - Countries with **persistent health crises, high disease burdens, or weaker healthcare systems** accumulate much higher mortality totals across the observed years.  
  - **Sub-Saharan African nations** tend to appear with higher cumulative totals, reflecting the combined impact of infectious diseases and limited healthcare resources.  
  - Many developed countries show slower accumulation due to stronger preventive and curative care systems.  

📂 File:  
- [`adult-mortality_rolling-total_by-country_and_year.csv`](./adult-mortality_rolling-total_by-country_and_year.csv)  

---

## 🚀 Key Insights
- **Life expectancy is rising globally**, but improvements are uneven, with some countries gaining over 10 years in a short period while others stagnate.  
- **Economic prosperity (GDP)** strongly correlates with longevity, though exceptions reveal the importance of governance, equity, and healthcare access.  
- **Developed vs Developing gap** persists: richer countries live longer, but gradual convergence is visible in some regions.  
- **BMI correlation** reflects food security and living standards, but is not causal — beyond a threshold, high BMI can be a health risk.  
- **Adult mortality analysis** highlights regions facing chronic health crises, showing how inequality compounds over time.  

---

## 🛠️ Tools Used
- **MySQL Workbench** (cleaning + queries)  
- **CSV exports** (to share results)  
- **GitHub** (version control & portfolio hosting)  

---

## 📌 How to Use
1. Clone this repo or download files.  
2. Explore `.sql` scripts to follow the cleaning and analysis process.  
3. Open `.csv` results directly on GitHub (clickable) or in Excel/Google Sheets.  
4. Compare the cleaned dataset with the exports to understand how the queries work.  

---

✍️ *This project is part of my data analysis portfolio, demonstrating SQL cleaning, querying, and interpretation skills using global life expectancy data.*  
EOF
