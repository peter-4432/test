# ----------------------------------------
# Streamlit App: CORD-19 Data Explorer
# ----------------------------------------
# Author: Your Name
# Description: A simple Streamlit web app to explore
# COVID-19 research paper metadata.
# ----------------------------------------

import streamlit as st
import pandas as pd
import matplotlib.pyplot as plt

# Load the cleaned data
df = pd.read_csv("cleaned_metadata.csv")
df['publish_time'] = pd.to_datetime(df['publish_time'], errors='coerce')
df['year'] = df['publish_time'].dt.year

# Title and description
st.title("CORD-19 Data Explorer")
st.write("This is a simple interactive app for exploring COVID-19 research data from the CORD-19 dataset.")

# Show dataset sample
if st.checkbox("Show sample data"):
    st.write(df.head())

# Year range filter
min_year = int(df['year'].min())
max_year = int(df['year'].max())
year_range = st.slider("Select publication year range:", min_year, max_year, (2020, 2021))
filtered = df[(df['year'] >= year_range[0]) & (df['year'] <= year_range[1])]

# Plot: publications by year
st.subheader("Publications by Year")
year_counts = filtered['year'].value_counts().sort_index()
fig, ax = plt.subplots()
ax.bar(year_counts.index, year_counts.values, color="skyblue")
ax.set_xlabel("Year")
ax.set_ylabel("Number of Papers")
ax.set_title("Publications by Year")
st.pyplot(fig)

# Plot: top journals
st.subheader("Top Journals")
top_journals = filtered['journal'].value_counts().head(10)
fig, ax = plt.subplots()
ax.barh(top_journals.index, top_journals.values, color="orange")
ax.set_xlabel("Number of Papers")
ax.set_ylabel("Journal")
ax.set_title("Top 10 Journals Publishing COVID-19 Research")
st.pyplot(fig)

# Footer
st.write("Data source: CORD-19 dataset by Allen Institute for AI")
