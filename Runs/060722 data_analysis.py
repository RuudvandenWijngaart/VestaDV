# -*- coding: utf-8 -*-
"""
Created on Wed Jul  6 10:42:00 2022

@author: poorthuisw
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
save_image = 1
provinces = 0
  
# Setting paths
hestia_path     = r'C:\Users\wesse\Documents\aaa Uni\Stage\GeoDMS\Hestia' # Set this to your Hestia folder
results_path    = os.path.join(hestia_path, 'LD', 'PD', 'Results', 'Kalibratie')
results_folder = 'LA_sweep_nauw'

path = os.path.join(results_path, results_folder)

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
print(data_frame)
max_year = len(df)-1

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

linestyle_tuple = [
     ('loosely dotted',        (0, (1, 10))),
     ('dotted',                (0, (1, 1))),
     ('densely dotted',        (0, (1, 1))),

     ('loosely dashed',        (0, (5, 10))),
     ('dashed',                (0, (5, 5))),
     ('densely dashed',        (0, (5, 1))),

     ('loosely dashdotted',    (0, (3, 10, 1, 10))),
     ('dashdotted',            (0, (3, 5, 1, 5))),
     ('densely dashdotted',    (0, (3, 1, 1, 1))),

     ('dashdotdotted',         (0, (3, 5, 1, 5, 1, 5))),
     ('loosely dashdotdotted', (0, (3, 10, 1, 10, 1, 10))),
     ('densely dashdotdotted', (0, (3, 1, 1, 1, 1, 1)))]

legend = []

variable_dict = {
    
    'ylabel' : ('Number of dwellings', 'Share of dwellings', 'Number of dwellings', 'Share of dwellings'),
    'title' : ('Energy labels', 'Energy labels', 'Heating installations', 'Heating installations'),
    'savepath' : ('labels_aantal.svg', 'labels_aandeel.svg', 'RV_aantal.svg', 'RV_aandeel.svg')
    }

# Data analysis
for index, var in enumerate(variable_dict['ylabel']):
    # Create canvas
    fig = plt.figure()
    ax = fig.add_axes([0,0,1,1])
    ax.set_xlabel('Year')
    ax.set_ylabel(variable_dict['ylabel'][index])
    ax.set_title(variable_dict['title'][index])
    ax.set_xlim(0, max_year)

    for scenario_id, filename in enumerate(files):
        scenario_color = colors[scenario_id]
        # style = linestyle_tuple[scenario_id][1]
        if variable_dict['title'][index] == 'Energy labels':
            # Read data per scenario
            aantal_woningen = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['Asl [Aansluiting]']
            label_A         = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['A [Aansluiting]']
            label_B         = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['b [Aansluiting]']
            label_C         = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['c [Aansluiting]']
            label_D         = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['d [Aansluiting]']
            label_E         = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['E [Aansluiting]']
            label_F         = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['f [Aansluiting]']
            label_G         = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['g [Aansluiting]']
            
            if variable_dict['ylabel'][index] == 'Share of dwellings':
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
                ax.plot(aandeel_label_A, color = scenario_color, label = f'Scenario {scenario_id+1}')
                ax.plot(aandeel_label_B, color = scenario_color, label = str())
                ax.plot(aandeel_label_C, color = scenario_color, label = str())
                ax.plot(aandeel_label_D, color = scenario_color, label = str())
                ax.plot(aandeel_label_E, color = scenario_color, label = str())
                ax.plot(aandeel_label_F, color = scenario_color, label = str())
                ax.plot(aandeel_label_G, color = scenario_color, label = str())
                
            else:
                # Plot data
                ax.plot(label_A, color = scenario_color, label = f'Scenario {scenario_id+1}')
                ax.plot(label_B, color = scenario_color, label = str())
                ax.plot(label_C, color = scenario_color, label = str())
                ax.plot(label_D, color = scenario_color, label = str())
                ax.plot(label_E, color = scenario_color, label = str())
                ax.plot(label_F, color = scenario_color, label = str())
                ax.plot(label_G, color = scenario_color, label = str())
                
        else:
            # Read data per scenario
            aantal_woningen = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['Asl [Aansluiting]']
            RV_gas          = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['RV_gas [Aansluiting]']
            RV_gebiedsoptie = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['RV_gebiedsoptie [Aansluiting]']
            RV_overig       = aantal_woningen-RV_gas-RV_gebiedsoptie
            
            
            if variable_dict['ylabel'][index] == 'Share of dwellings':
                ax.set_ylim(0, 1)
                # Calculate relative shares
                aandeel_RV_gas          = RV_gas.div(aantal_woningen)
                aandeel_RV_gebiedsoptie = RV_gebiedsoptie.div(aantal_woningen)
                aandeel_RV_overig       = RV_overig.div(aantal_woningen)
                
                # Plot data
                ax.plot(aandeel_RV_gas,          color = scenario_color, linewidth = thickness, alpha = transparency, label = f'Scenario {scenario_id+1}')
                ax.plot(aandeel_RV_gebiedsoptie, color = scenario_color, linewidth = thickness, alpha = transparency,label = str())
                ax.plot(aandeel_RV_overig,       color = scenario_color, linewidth = thickness, alpha = transparency,label = str())
            
            else:
                 # Plot data
                 ax.plot(RV_gas, color = scenario_color, label = f'Scenario {scenario_id+1}')
                 ax.plot(RV_gebiedsoptie, color = scenario_color, label = str())
                 ax.plot(RV_overig,       color = scenario_color, label = str())
            
        scenario_id+=1

    # Save plot
    ax.legend(loc='upper right', prop={'size': 7})
    if save_image == True:
        savepath = os.path.join(path, variable_dict['savepath'][index])
        fig.savefig(savepath, bbox_inches='tight')
    plt.show()