# -*- coding: utf-8 -*-
"""
Created on Tue Jun  7 11:21:27 2022

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
  
# Setting paths
hestia_path     = r'K:\Hestia' # Set this to your Hestia folder
results_path    = os.path.join(hestia_path, 'LD', 'PD', 'Results', 'Thesis')
results_folder = '2022_06_08-16_03_55 zeewolde LA gekalibreerd'
path = os.path.join(results_path, results_folder)

# Load contants of all csv's into one DataFrame
# https://www.geeksforgeeks.org/getting-all-csv-files-from-a-directory-using-python/
# Find file locations
files = glob.glob(path + "/*.csv")
files = files[:-1]
# Define DataFrame and list
data_frame = pd.DataFrame()
data = []

for filename in files:
    df = pd.read_csv(filename, index_col=None)
    data.append(df)
  
# Convert list to DataFrame
data_frame = pd.concat(data)

# Parameters
save_image = 1
max_year = 20

# Define colors, linetyle and legend for plotting
colors = plt.cm.rainbow(np.linspace(0, 1, len(files)))

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

# Data analysis

# Labels absolute

# Create canvas
fig = plt.figure()
ax = fig.add_axes([0,0,1,1])
ax.set_xlabel('Year')
ax.set_ylabel('Number of dwellings')
ax.set_title("Energy labels")
ax.set_xlim(0, max_year)
# ax.set_ylim(0, 1)

for scenario_id, filename in enumerate(files):
    scenario_color = colors[scenario_id]
    style = linestyle_tuple[scenario_id][1]

    # Read data per scenario
    aantal_woningen = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['Asl [Aansluiting]']
    label_A         = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['A [Aansluiting]']
    label_B         = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['b [Aansluiting]']
    label_C         = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['c [Aansluiting]']
    label_D         = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['d [Aansluiting]']
    label_E         = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['E [Aansluiting]']
    label_F         = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['f [Aansluiting]']
    label_G         = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['g [Aansluiting]']
    label_overig    = aantal_woningen-label_A-label_B-label_C-label_D-label_E-label_F-label_G
    
    # if scenario_id == 0:
    #     ax.plot(label_A, color = scenario_color, linestyle = style, label = 'Baseline')
    # else:
    ax.plot(label_A, color = scenario_color, linestyle = style, label = f'Scenario {scenario_id+1}')
    ax.plot(label_B, color = scenario_color, linestyle = style, label = str())
    ax.plot(label_C, color = scenario_color, linestyle = style, label = str())
    ax.plot(label_D, color = scenario_color, linestyle = style, label = str())
    ax.plot(label_E, color = scenario_color, linestyle = style, label = str())
    ax.plot(label_F, color = scenario_color, linestyle = style, label = str())
    ax.plot(label_G, color = scenario_color, linestyle = style, label = str())
    ax.plot(label_overig, color = scenario_color, label = str())

    scenario_id+=1

# Save plot
ax.legend(loc='upper right', prop={'size': 7})
if save_image == True:
    savepath = os.path.join(path, 'labels_aantal.svg')
    fig.savefig(savepath, bbox_inches='tight')
plt.show()   

# Labels relative

# Create canvas
fig = plt.figure()
ax = fig.add_axes([0,0,1,1])
ax.set_xlabel('Year')
ax.set_ylabel('Share of dwellings')
ax.set_title("Energy labels")
ax.set_xlim(0, max_year)
ax.set_ylim(0, 1)

for scenario_id, filename in enumerate(files):
    scenario_color = colors[scenario_id]
    style = linestyle_tuple[scenario_id][1]

    # Read data per scenario
    aantal_woningen = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['Asl [Aansluiting]']
    label_A         = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['A [Aansluiting]']
    label_B         = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['b [Aansluiting]']
    label_C         = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['c [Aansluiting]']
    label_D         = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['d [Aansluiting]']
    label_E         = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['E [Aansluiting]']
    label_F         = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['f [Aansluiting]']
    label_G         = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['g [Aansluiting]']
    label_overig    = aantal_woningen-label_A-label_B-label_C-label_D-label_E-label_F-label_G
    
    # Calculate relative shares
    aandeel_label_A      = label_A.div(aantal_woningen)
    aandeel_label_B      = label_B.div(aantal_woningen)
    aandeel_label_C      = label_C.div(aantal_woningen)
    aandeel_label_D      = label_D.div(aantal_woningen)
    aandeel_label_E      = label_E.div(aantal_woningen)
    aandeel_label_F      = label_F.div(aantal_woningen)
    aandeel_label_G      = label_G.div(aantal_woningen)
    aandeel_label_overig = label_overig.div(aantal_woningen)
    
    #Plot data
    # if scenario_id == 0:
    #     ax.plot(aandeel_label_A, color = scenario_color, linestyle = style, label = 'Baseline')
    # else:
    ax.plot(aandeel_label_A, color = scenario_color, linestyle = style, label = f'Scenario {scenario_id+1}')
    ax.plot(aandeel_label_B, color = scenario_color, linestyle = style, label = str())
    ax.plot(aandeel_label_C, color = scenario_color, linestyle = style, label = str())
    ax.plot(aandeel_label_D, color = scenario_color, linestyle = style, label = str())
    ax.plot(aandeel_label_E, color = scenario_color, linestyle = style, label = str())
    ax.plot(aandeel_label_F, color = scenario_color, linestyle = style, label = str())
    ax.plot(aandeel_label_G, color = scenario_color, linestyle = style, label = str())
    ax.plot(aandeel_label_overig, color = scenario_color, label = str())

    scenario_id+=1
   
# Save plot
ax.legend(loc='upper right', prop={'size': 7})
if save_image == True:
    savepath = os.path.join(path, 'labels_aandeel.svg')
    fig.savefig(savepath, bbox_inches='tight')
plt.show()   

# Space heating absolute
# Create canvas
fig = plt.figure()
ax = fig.add_axes([0,0,1,1])
ax.set_xlabel('Year')
ax.set_ylabel('Number of dwellings')
ax.set_title("Heating installations")
ax.set_xlim(0, max_year)
# ax.set_ylim(0, 1)

for scenario_id, filename in enumerate(files):
    scenario_color = colors[scenario_id]
    style = linestyle_tuple[scenario_id][1]
    
    # Read data per scenario
    aantal_woningen = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['Asl [Aansluiting]']
    RV_gas          = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['RV_gas [Aansluiting]']
    RV_gebiedsoptie = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['RV_gebiedsoptie [Aansluiting]']
    RV_overig       = aantal_woningen-RV_gas-RV_gebiedsoptie

    # Plot data
    # if scenario_id == 0:
    #     ax.plot(RV_gas, color = scenario_color, linestyle = style, label = 'Baseline')
    # else:
    ax.plot(RV_gas, color = scenario_color, linestyle = style, label = f'Scenario {scenario_id+1}')
    ax.plot(RV_gebiedsoptie, color = scenario_color, linestyle = style, label = str())
    ax.plot(RV_overig,       color = scenario_color, linestyle = style, label = str())
      
    scenario_id+=1

# Save plot
ax.legend(loc='upper right', prop={'size': 7})
if save_image == True:
    savepath = os.path.join(path, 'RV_aantal.svg')
    fig.savefig(savepath, bbox_inches='tight')
plt.show()   

# Space heating relative

# Create canvas
fig = plt.figure()
ax = fig.add_axes([0,0,1,1])
ax.set_xlabel('Year')
ax.set_ylabel('Share of dwellings')
ax.set_title("Heating installations")
ax.set_xlim(0, max_year)
ax.set_ylim(0, 1)

for scenario_id, filename in enumerate(files):
    scenario_color = colors[scenario_id]
    style = linestyle_tuple[scenario_id][1]
    
    # Read data per scenario
    aantal_woningen = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['Asl [Aansluiting]']
    RV_gas          = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['RV_gas [Aansluiting]']
    RV_gebiedsoptie = data_frame[data_frame['Scenario_ID'] == scenario_id+1]['RV_gebiedsoptie [Aansluiting]']
    RV_overig       = aantal_woningen-RV_gas-RV_gebiedsoptie
    
    # Calculate relative shares
    aandeel_RV_gas          = RV_gas.div(aantal_woningen)
    aandeel_RV_gebiedsoptie = RV_gebiedsoptie.div(aantal_woningen)
    aandeel_RV_overig       = RV_overig.div(aantal_woningen)
    
    # Plot data
    # if scenario_id == 0:
    #     ax.plot(aandeel_RV_gas, color = scenario_color, linestyle = style, label = 'Baseline')
    # else:
    ax.plot(aandeel_RV_gas, color = scenario_color, linestyle = style, label = f'Scenario {scenario_id+1}')
    ax.plot(aandeel_RV_gebiedsoptie, color = scenario_color, linestyle = style, label = str())
    ax.plot(aandeel_RV_overig,       color = scenario_color, linestyle = style, label = str())
      
    scenario_id+=1

# Save plot
ax.legend(loc='upper right', prop={'size': 7})
if save_image == True:
    savepath = os.path.join(path, 'RV_aandeel.svg')
    fig.savefig(savepath, bbox_inches='tight')
plt.show()   
    
