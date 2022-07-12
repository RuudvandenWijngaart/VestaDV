# -*- coding: utf-8 -*-
"""
Created on Mon Jul 11 15:14:17 2022

@author: wessel
"""

# Reset parameters between runs of script in Spyder
from IPython import get_ipython
get_ipython().magic('reset -sf')

# Import modules
import glob
import os
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

# Parameters
save_image = 0
provinces = 0

# Setting paths
hestia_path     = r'C:\Users\wesse\Documents\aaa Uni\Stage\GeoDMS\Hestia' # Set this to your Hestia folder
results_path    = os.path.join(hestia_path, 'LD', 'PD', 'Results', 'Kalibratie')
results_folder = 'LA_sweep_nauw'

path = os.path.join(results_path, results_folder)

# Valdiation data
validation_years = [0,6,12,18]

validation_gas   = [0.79, 0.91, 0.84, 0.87]
validation_DH    = [0.10, 0.04, 0.12, 0.12]
validation_other = [0.11, 0.05, 0.05, 0.02]

validation_A = [0.00, 0.01, 0.05, 0.17]
validation_B = [0.03, 0.06, 0.14, 0.16]
validation_C = [0.10, 0.16, 0.24, 0.29]
validation_D = [0.17, 0.47, 0.21, 0.16]
validation_E = [0.18, 0.06, 0.12, 0.06]
validation_F = [0.25, 0.13, 0.12, 0.06]
validation_G = [0.27, 0.11, 0.08, 0.05]




# Load contants of all csv's into one DataFrame
# https://www.geeksforgeeks.org/getting-all-csv-files-from-a-directory-using-python/
# Find file locations
all_files = glob.glob(path + "/*.csv")
files= []
for file in all_files:
    if 'ScenarioInputs' not in file and 'nationaal' not in file:
        files.append(file)

# Define DataFrame and list
data_frame = pd.DataFrame()
data = []
for filename in files:
    df = pd.read_csv(filename, index_col=None, sep=';')
    data.append(df)

# Convert list to DataFrame
data_frame = pd.concat(data)
max_year = len(df)-1
data_frame.sort_values(by=['Scenario_ID','Tellingen_rel'], inplace=True)

if provinces == 1:
    # Add provinces together to get national data
    provinces_num = 12
    scenario_num = 0
    while scenario_num < len(files):
        df_export = data_frame[(data_frame['Scenario_ID'] > scenario_num) & (data_frame['Scenario_ID'] <= scenario_num + provinces_num)].groupby('Tellingen_rel').sum().loc[:,'Scenario_ID':'nrYears']
        df_export = df_export.assign(Scenario_ID=scenario_num+1)
        df_export.to_csv(os.path.join(path,f'nationaal_sc{int(scenario_num/12 +1)}.csv'))
        scenario_num+=provinces_num

# Define colors, linetyle and legend for plotting
colors = plt.cm.rainbow(np.linspace(0, 1, len(files)))
thickness = 1.5
transparency = 0.8


# Create canvas
fig = plt.figure()
ax = fig.add_axes([0,0,1,1])
ax.set_xlabel('Year')
ax.set_ylabel('Share of dwellings')
ax.set_title('Heating installations')
ax.set_xlim(0, max_year)
    
scenario_ids = range(0, max(data_frame['Scenario_ID']))

# This version plots all scenario's in the same colour, with validation data to match
for scenario in scenario_ids:
    # Read data per scenario
    aantal_woningen = data_frame[data_frame['Scenario_ID'] == scenario]['Asl [Aansluiting]']
    RV_gas          = data_frame[data_frame['Scenario_ID'] == scenario]['RV_gas [Aansluiting]']
    RV_gebiedsoptie = data_frame[data_frame['Scenario_ID'] == scenario]['RV_gebiedsoptie [Aansluiting]']
    RV_overig       = aantal_woningen-RV_gas-RV_gebiedsoptie
    
    ax.set_ylim(0, 1)
    
    # Calculate relative shares
    aandeel_RV_gas          = RV_gas.div(aantal_woningen)
    aandeel_RV_gebiedsoptie = RV_gebiedsoptie.div(aantal_woningen)
    aandeel_RV_overig       = RV_overig.div(aantal_woningen)

    # Plot data
    if scenario == 0:
        legend_label = ['Gas', 'Collective', 'Other']
    else:
        legend_label = [str(), str(), str()]
    ax.plot(aandeel_RV_gas,          linewidth = thickness, alpha = transparency, label = legend_label[0])
    ax.plot(aandeel_RV_gebiedsoptie, linewidth = thickness, alpha = transparency, label = legend_label[1])
    ax.plot(aandeel_RV_overig,       linewidth = thickness, alpha = transparency, label = legend_label[2])
    
    ax.set_prop_cycle(None)

# Plot validation data
ax.scatter(validation_years, validation_gas,   label = 'Validation gas')
ax.scatter(validation_years, validation_DH,    label = 'Validation collective')
ax.scatter(validation_years, validation_other, label = 'Validation other')

# Save plot
ax.legend( prop={'size': 7})
if save_image == True:
    savepath = os.path.join(path, 'heating.svg')
    fig.savefig(savepath, bbox_inches='tight')
plt.show()

# Create canvas
fig = plt.figure()
ax = fig.add_axes([0,0,1,1])
ax.set_xlabel('Year')
ax.set_ylabel('Share of dwellings')
ax.set_title('Energy labels')
ax.set_xlim(0, max_year)

for scenario in scenario_ids:
    # Read data per scenario
    aantal_woningen = data_frame[data_frame['Scenario_ID'] == scenario]['Asl [Aansluiting]']
    label_A         = data_frame[data_frame['Scenario_ID'] == scenario]['A [Aansluiting]']
    label_B         = data_frame[data_frame['Scenario_ID'] == scenario]['b [Aansluiting]']
    label_C         = data_frame[data_frame['Scenario_ID'] == scenario]['c [Aansluiting]']
    label_D         = data_frame[data_frame['Scenario_ID'] == scenario]['d [Aansluiting]']
    label_E         = data_frame[data_frame['Scenario_ID'] == scenario]['E [Aansluiting]']
    label_F         = data_frame[data_frame['Scenario_ID'] == scenario]['f [Aansluiting]']
    label_G         = data_frame[data_frame['Scenario_ID'] == scenario]['g [Aansluiting]']
    
    ax.set_ylim(0, 1)
    # Calculate relative shares
    aandeel_label_A      = label_A.div(aantal_woningen)
    aandeel_label_B      = label_B.div(aantal_woningen)
    aandeel_label_C      = label_C.div(aantal_woningen)
    aandeel_label_D      = label_D.div(aantal_woningen)
    aandeel_label_E      = label_E.div(aantal_woningen)
    aandeel_label_F      = label_F.div(aantal_woningen)
    aandeel_label_G      = label_G.div(aantal_woningen)
    
    #Plot data
    if scenario == 0:
        legend_label = ['Label A','Label B','Label C','Label D','Label E','Label F','Label G']
    else:
        legend_label = [str(), str(), str(), str(), str(), str(), str()]
    ax.plot(aandeel_label_A, label = legend_label[0])
    ax.plot(aandeel_label_B, label = legend_label[1])
    ax.plot(aandeel_label_C, label = legend_label[2])
    ax.plot(aandeel_label_D, label = legend_label[3])
    ax.plot(aandeel_label_E, label = legend_label[4])
    ax.plot(aandeel_label_F, label = legend_label[5])
    ax.plot(aandeel_label_G, label = legend_label[6])
    
    ax.set_prop_cycle(None)

# plot validation data 
ax.scatter(validation_years, validation_A,   label = 'Validation label A')
ax.scatter(validation_years, validation_B,   label = 'Validation label B')
ax.scatter(validation_years, validation_C,   label = 'Validation label C')
ax.scatter(validation_years, validation_D,   label = 'Validation label D')
ax.scatter(validation_years, validation_E,   label = 'Validation label E')
ax.scatter(validation_years, validation_F,   label = 'Validation label F')
ax.scatter(validation_years, validation_G,   label = 'Validation label G')

# Save plot
ax.legend( prop={'size': 7})
if save_image == True:
    savepath = os.path.join(path, 'labels.svg')
    fig.savefig(savepath, bbox_inches='tight')
plt.show()

