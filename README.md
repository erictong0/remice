
<!-- README.md is generated from README.Rmd. Please edit that file -->

# remice <a href="https://erictong2.github.io/remice"><img src="man/figures/logo.svg" align="right" height="139" alt="remice website" /></a>

Have your collaborators been remiss in their data collection?

Have you experienced characters in your numeric columns?

Do rows ever get incorrectly entered or swapped?

The overarching goal of the **remice** package is to account for
**remiss** data, providing a way to identify and solve those problems.

## Installation

You can install the development version of remice like so:

``` r
install_github("erictong2/remice")
```

If you prefer, you can also go to the Github website
(<https://github.com/EricTong2/remice/>) and download the package from
there.

## Function List

These are the functions included in the package:

- `analyze_type()` takes a column of characters and determines if any
  values in that row are not of a specified type. While this does not
  directly fix the types of the data, it creates a table to highlight
  areas in which the data could cause errors for other functions,
  allowing for those rows to be manually fixed.

- `table_different()` takes a column of characters and creates a table
  of strings that are uncommonly found in a dataset. This is aimed to
  mitigate various typos found by either entering data or from survey
  responses. For example, if all of the column values are “True” except
  for a single “Ture”, it is likely for a typo to have occurred. This
  function does not fix any problems, but it highlights the row numbers
  where the data should be checked.

- `separate_list()` takes a column of characters and creates a table of
  the most common responses when multiple responses could exist in one
  row. For example, if two of the responses are “Apple, Banana, and
  Orange” and “Banana, Orange”, this would output a table of “Apple: 1,
  Banana: 2, Orange: 2.” This can be used on a survey about comfort
  foods, where a response might be

- `plot_outliers()` takes multiple columns of numeric data that was
  longitudinally collected and checks for any abnormally large changes
  in the data. This could be used to check for potential outliers or
  areas where the data was mis-input: for example, recording “11” grams
  instead of “21” grams. In addition, the user inputs a percent change,
  and any points that have a change greater than the input for any two
  points would be plotted in a graph.

## Data List

- `food_data` is a survey of 125 individuals from Mercyhurst University.
  There are three columns, all with 125 character entries:
  - `comfort_food` is a list of students’ comfort foods
  - `food_childhood` is a list of students’ childhood foods
  - `meals_dinner_friend` is a list of foods eaten when friends came
    over
- `mouse_data_birth` is a dataset from 32 mice that has four columns,
  describing the mouse `ID`, `Sex`, `Number`, and the `Treatment` type
- `mouse_data_bw_dirty` is a dataset from the same 32 mice that has
  seven columns, the first being the same `ID` as `mouse_data_birth`.
  The other six columns describe three dates over which the data was
  collected alternating between the `Body Weight` of the mouse and the
  `Date` of which the `Body Weight` was collected
- `mouse_data_bw_clean` provides the same information as
  `mouse_data_bw_dirty` but includes cleaned data to provide examples of
  functions.

## Example

This is an example of `separate_list()` using the Comfort Food column
from `food_data`

``` r
library(remice)

separate_list(food_data, "comfort_food", 5)
```

<div id="pmnldzlgzi" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#pmnldzlgzi table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#pmnldzlgzi thead, #pmnldzlgzi tbody, #pmnldzlgzi tfoot, #pmnldzlgzi tr, #pmnldzlgzi td, #pmnldzlgzi th {
  border-style: none;
}
&#10;#pmnldzlgzi p {
  margin: 0;
  padding: 0;
}
&#10;#pmnldzlgzi .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 3px;
  border-top-color: #D3D3D3;
  border-right-style: solid;
  border-right-width: 3px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 3px;
  border-bottom-color: #D3D3D3;
  border-left-style: solid;
  border-left-width: 3px;
  border-left-color: #D3D3D3;
}
&#10;#pmnldzlgzi .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#pmnldzlgzi .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#pmnldzlgzi .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#pmnldzlgzi .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#pmnldzlgzi .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#pmnldzlgzi .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#pmnldzlgzi .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#pmnldzlgzi .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#pmnldzlgzi .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#pmnldzlgzi .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#pmnldzlgzi .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#pmnldzlgzi .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#pmnldzlgzi .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#pmnldzlgzi .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#pmnldzlgzi .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#pmnldzlgzi .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#pmnldzlgzi .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#pmnldzlgzi .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#pmnldzlgzi .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#pmnldzlgzi .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#pmnldzlgzi .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#pmnldzlgzi .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#pmnldzlgzi .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#pmnldzlgzi .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#pmnldzlgzi .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#pmnldzlgzi .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#pmnldzlgzi .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#pmnldzlgzi .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#pmnldzlgzi .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#pmnldzlgzi .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#pmnldzlgzi .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#pmnldzlgzi .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#pmnldzlgzi .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#pmnldzlgzi .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#pmnldzlgzi .gt_left {
  text-align: left;
}
&#10;#pmnldzlgzi .gt_center {
  text-align: center;
}
&#10;#pmnldzlgzi .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#pmnldzlgzi .gt_font_normal {
  font-weight: normal;
}
&#10;#pmnldzlgzi .gt_font_bold {
  font-weight: bold;
}
&#10;#pmnldzlgzi .gt_font_italic {
  font-style: italic;
}
&#10;#pmnldzlgzi .gt_super {
  font-size: 65%;
}
&#10;#pmnldzlgzi .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#pmnldzlgzi .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#pmnldzlgzi .gt_indent_1 {
  text-indent: 5px;
}
&#10;#pmnldzlgzi .gt_indent_2 {
  text-indent: 10px;
}
&#10;#pmnldzlgzi .gt_indent_3 {
  text-indent: 15px;
}
&#10;#pmnldzlgzi .gt_indent_4 {
  text-indent: 20px;
}
&#10;#pmnldzlgzi .gt_indent_5 {
  text-indent: 25px;
}
&#10;#pmnldzlgzi .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}
&#10;#pmnldzlgzi div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="2" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Separated Word Frequencies</td>
    </tr>
    &#10;    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_center" rowspan="1" colspan="1" scope="col" id="Word">Word</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Frequency">Frequency</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="Word" class="gt_row gt_center">ice cream</td>
<td headers="Frequency" class="gt_row gt_right">45</td></tr>
    <tr><td headers="Word" class="gt_row gt_center">pizza</td>
<td headers="Frequency" class="gt_row gt_right">37</td></tr>
    <tr><td headers="Word" class="gt_row gt_center">chips</td>
<td headers="Frequency" class="gt_row gt_right">26</td></tr>
    <tr><td headers="Word" class="gt_row gt_center">chocolate</td>
<td headers="Frequency" class="gt_row gt_right">25</td></tr>
    <tr><td headers="Word" class="gt_row gt_center">cookies</td>
<td headers="Frequency" class="gt_row gt_right">17</td></tr>
    <tr><td headers="Word" class="gt_row gt_center">cheese</td>
<td headers="Frequency" class="gt_row gt_right">16</td></tr>
    <tr><td headers="Word" class="gt_row gt_center">mac</td>
<td headers="Frequency" class="gt_row gt_right">11</td></tr>
    <tr><td headers="Word" class="gt_row gt_center">pasta</td>
<td headers="Frequency" class="gt_row gt_right">9</td></tr>
    <tr><td headers="Word" class="gt_row gt_center">cake</td>
<td headers="Frequency" class="gt_row gt_right">7</td></tr>
    <tr><td headers="Word" class="gt_row gt_center">candy</td>
<td headers="Frequency" class="gt_row gt_right">7</td></tr>
    <tr><td headers="Word" class="gt_row gt_center">french fries</td>
<td headers="Frequency" class="gt_row gt_right">7</td></tr>
    <tr><td headers="Word" class="gt_row gt_center">popcorn</td>
<td headers="Frequency" class="gt_row gt_right">7</td></tr>
    <tr><td headers="Word" class="gt_row gt_center">pretzels</td>
<td headers="Frequency" class="gt_row gt_right">5</td></tr>
  </tbody>
  &#10;  
</table>
</div>

This is an example of `plot_outliers()` using the `mouse_data_bw_clean`
dataset:

``` r
library(remice)

table_different(mouse_data_birth, "Treatment", 5)
```

<div id="ozslihfktx" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#ozslihfktx table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#ozslihfktx thead, #ozslihfktx tbody, #ozslihfktx tfoot, #ozslihfktx tr, #ozslihfktx td, #ozslihfktx th {
  border-style: none;
}
&#10;#ozslihfktx p {
  margin: 0;
  padding: 0;
}
&#10;#ozslihfktx .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 3px;
  border-top-color: #D3D3D3;
  border-right-style: solid;
  border-right-width: 3px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 3px;
  border-bottom-color: #D3D3D3;
  border-left-style: solid;
  border-left-width: 3px;
  border-left-color: #D3D3D3;
}
&#10;#ozslihfktx .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#ozslihfktx .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#ozslihfktx .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#ozslihfktx .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#ozslihfktx .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#ozslihfktx .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#ozslihfktx .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#ozslihfktx .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#ozslihfktx .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#ozslihfktx .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#ozslihfktx .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#ozslihfktx .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#ozslihfktx .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#ozslihfktx .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#ozslihfktx .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#ozslihfktx .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#ozslihfktx .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#ozslihfktx .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ozslihfktx .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#ozslihfktx .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#ozslihfktx .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#ozslihfktx .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ozslihfktx .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#ozslihfktx .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#ozslihfktx .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#ozslihfktx .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ozslihfktx .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#ozslihfktx .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#ozslihfktx .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#ozslihfktx .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#ozslihfktx .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#ozslihfktx .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ozslihfktx .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#ozslihfktx .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ozslihfktx .gt_left {
  text-align: left;
}
&#10;#ozslihfktx .gt_center {
  text-align: center;
}
&#10;#ozslihfktx .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#ozslihfktx .gt_font_normal {
  font-weight: normal;
}
&#10;#ozslihfktx .gt_font_bold {
  font-weight: bold;
}
&#10;#ozslihfktx .gt_font_italic {
  font-style: italic;
}
&#10;#ozslihfktx .gt_super {
  font-size: 65%;
}
&#10;#ozslihfktx .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#ozslihfktx .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#ozslihfktx .gt_indent_1 {
  text-indent: 5px;
}
&#10;#ozslihfktx .gt_indent_2 {
  text-indent: 10px;
}
&#10;#ozslihfktx .gt_indent_3 {
  text-indent: 15px;
}
&#10;#ozslihfktx .gt_indent_4 {
  text-indent: 20px;
}
&#10;#ozslihfktx .gt_indent_5 {
  text-indent: 25px;
}
&#10;#ozslihfktx .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}
&#10;#ozslihfktx div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="2" class="gt_heading gt_title gt_font_normal gt_bottom_border" style>Inconsistent Strings</td>
    </tr>
    &#10;    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Row">Row Number</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="String">String</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="Row" class="gt_row gt_right">11</td>
<td headers="String" class="gt_row gt_left">Placobo</td></tr>
    <tr><td headers="Row" class="gt_row gt_right">20</td>
<td headers="String" class="gt_row gt_left">Trmt</td></tr>
  </tbody>
  &#10;  
</table>
</div>
