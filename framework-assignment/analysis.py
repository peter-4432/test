# ----------------------------------------
# CORD-19 Research Data Analysis
# ----------------------------------------
# Author: Your Name
# Description: A simple beginner-friendly data analysis
# using the metadata.csv file from the CORD-19 dataset.

# Step 1: Import the required libraries
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Step 2: Load the dataset
df = pd.read_csv("metadata.csv")
print("Data loaded successfully!")

# Step 3: Take a quick look at the data
print("Shape of the dataset:", df.shape)
print("\nFirst few rows:")
print(df.head())

# Step 4: Check for missing values
print("\nMissing values in each column:")
print(df.isnull().sum())

# Step 5: Clean and prepare the data
df = df.dropna(subset=['publish_time'])  # remove rows with missing dates
df['publish_time'] = pd.to_datetime(df['publish_time'], errors='coerce')
df['year'] = df['publish_time'].dt.year
df['abstract_word_count'] = df['abstract'].fillna('').apply(lambda x: len(x.split()))

# Step 6: Basic statistics
print("\nSummary statistics:")
print(df.describe())

# Step 7: Publications by year
year_counts = df['year'].value_counts().sort_index()
plt.figure(figsize=(8,5))
plt.bar(year_counts.index, year_counts.values)
plt.title('Publications by Year')
plt.xlabel('Year')
plt.ylabel('Number of Papers')
plt.show()

# Step 8: Top publishing journals
top_journals = df['journal'].value_counts().head(10)
plt.figure(figsize=(8,5))
sns.barplot(x=top_journals.values, y=top_journals.index)
plt.title('Top 10 Journals Publishing COVID-19 Research')
plt.xlabel('Number of Papers')
plt.ylabel('Journal')
plt.show()

# Step 9: Save cleaned version
df.to_csv("cleaned_metadata.csv", index=False)
print("Cleaned data saved as cleaned_metadata.csv")