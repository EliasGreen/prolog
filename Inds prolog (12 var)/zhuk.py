import tkinter

from matplotlib.backends.backend_tkagg import (
    FigureCanvasTkAgg, NavigationToolbar2Tk)
# Implement the default Matplotlib key bindings.
from matplotlib.backend_bases import key_press_handler
from matplotlib.figure import Figure

import numpy as np

import matplotlib.pyplot as plt
import networkx as nx
from pyswip import Prolog




root = tkinter.Tk()
root.wm_title("Embedding in Tk")


prolog = Prolog()
prolog.consult('onorabotaet.pl')
print(list(prolog.query("loadDB.")))
nodes = [node['X'] for node in list(prolog.query("node(X, Y)."))]
print(nodes)
edges = [(edge['X'], edge['Y']) for edge in prolog.query("edge(X, Y, Z).")]
print(edges)
isTree = list(prolog.query("isTree(graph).")) == [{}]
print(isTree)

G=nx.Graph()
G.add_nodes_from(nodes)
G.add_edges_from(edges)

fig = Figure(figsize=(5,4), dpi=100)
a = fig.add_subplot(111)
pos=nx.spring_layout(G)
nx.draw(G,pos,ax=a,with_labels=True)#Figure(figsize=(5, 4), dpi=100)
#plt.show()

canvas = FigureCanvasTkAgg(fig, master=root)  # A tk.DrawingArea.
canvas.draw()
canvas.get_tk_widget().pack(side=tkinter.TOP, fill=tkinter.BOTH, expand=1)

#toolbar = NavigationToolbar2Tk(canvas, root)
#toolbar.update()
#canvas.get_tk_widget().pack(side=tkinter.TOP, fill=tkinter.BOTH, expand=1)


def on_key_press(event):
    print("you pressed {}".format(event.key))
    key_press_handler(event, canvas, toolbar)


canvas.mpl_connect("key_press_event", on_key_press)


def _quit():
    root.quit()     # stops mainloop
    root.destroy()  # this is necessary on Windows to prevent
                    # Fatal Python Error: PyEval_RestoreThread: NULL tstate


button = tkinter.Button(master=root, text=str("Tree" if isTree else "Not Tree"), command=_quit)
button.pack(side=tkinter.BOTTOM)

tkinter.mainloop()