# TRACE

Optional scripts to produce Model C table and a summary chart.

1. In `data.py` ...
   * In the header, populate `courses` dictionary
   * In the header, populate `dept_means` dictionary
   * In penultimate section, call `add_section` for each section taught

2. For Model C ...
   * Call `summary_table()` in `data.py`
   * Copy/paste resulting as body of `section-e/model-c.tex`

3. For summary chart (per-semester bar chart, comparing your average TRACE to the average department mean, with error bars for low/high score) ...
   * Call `chart_data()` in `data.py`
   * Paste as columns A-E in `tracechart.xlsx`
   * Fix data selection for chart as necessary
   * Save chart as `section-e/files/TRACEChart.pdf`
