import tkinter as tk
from tkinter import ttk

def get_selected_values():
    selected_values = [select_box.get(idx) for idx in checkbox_state if checkbox_state[idx].get()]
    print("Selected Values:", selected_values)

root = tk.Tk()
root.title("Select Multiple Values")

# Sample options for the select box
options = ["Option 1", "Option 2", "Option 3", "Option 4", "Option 5"]

# Create the select box
select_box = ttk.Combobox(root, values=options, state="readonly")
select_box.pack(pady=10)

# Dictionary to store checkbox states
checkbox_state = {}

# Create checkboxes for each option
for idx, option in enumerate(options):
    checkbox_state[idx] = tk.BooleanVar()
    checkbox_state[idx].set(False)
    checkbox = tk.Checkbutton(root, text=option, variable=checkbox_state[idx])
    checkbox.pack()

# Button to get selected values
get_values_button = tk.Button(root, text="Get Selected Values", command=get_selected_values)
get_values_button.pack(pady=10)

root.mainloop()