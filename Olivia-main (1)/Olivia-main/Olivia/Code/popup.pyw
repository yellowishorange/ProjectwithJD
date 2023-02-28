import tkinter
from PIL import ImageTk, Image
import os
import random
# Create an instance of tkinter window
def openpic():
    images = []
    picture_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'images')


    def getFiles(path):
        for file in os.listdir(path):
            if file.endswith(".jpg"):
                images.append(os.path.join(path, file))

    getFiles(picture_directory)
    picture_path = random.choice(images)

    win = tkinter.Tk()
# Define the geometry of the window
    win.overrideredirect(1)
    frame = tkinter.Frame(win)
    frame.pack()
# Create an object of tkinter ImageTk
    img = ImageTk.PhotoImage(Image.open(picture_path))
# Create a Label Widget to display the text or Image
    label = tkinter.Label(frame, image=img)
    label.pack()
# Geometrik
    win.eval('tk::PlaceWindow . center')
    win.after(20000,lambda:win.destroy())
    win.mainloop()
openpic()