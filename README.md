# SQL Script: Clean and Explore Netflix Data

This SQL script, `my_netflix.sql`, is designed to clean and perform a short exploratory analysis on the **Netflix Movies and TV Shows** dataset.

## Dataset
The script uses the dataset **"Netflix Movies and TV Shows"** from [Kaggle](https://www.kaggle.com/datasets/shivamb/netflix-shows).  
The dataset contains information about Netflix content such as:  
- Title, Director, Cast  
- Country, Date Added, Release Year  
- Rating, Duration  

## Script Purpose
- **Data Cleaning:**   
- **Exploratory Data Analysis (EDA):** Allows inspecting basic patterns in the dataset.  
- **Insights:** Generates initial observations about release dates, content distribution, and trends.

## Usage
1. Load the Netflix dataset into your MySQL database.  
2. Open and execute `my_netflix.sql`.  
3. Review the cleaned dates and the insights produced by the script.

## Notes
- Dates are stored as MySQL `DATE` (`YYYY-MM-DD`) and formatted for readability using `DATE_FORMAT`.  
- Make sure you have the right to use the Kaggle dataset.
