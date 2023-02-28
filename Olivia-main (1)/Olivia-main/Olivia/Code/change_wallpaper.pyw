import random
import os
import ctypes
# create string
def change_now():
    images = []
    picture_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'wallpaper')


    def getFiles(path):
        for file in os.listdir(path):
            if file.endswith(".jpg"):
                images.append(os.path.join(path, file))

    getFiles(picture_directory)
    picture_path = random.choice(images) # chose random pic
    print(picture_path)

    ctypes.windll.user32.SystemParametersInfoW(20, 0, picture_path, 3)


change_now()
