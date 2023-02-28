import os
import random
from playsound import playsound

def play_random_sound():
    sound_directory = os.path.join(os.path.dirname(__file__), 'sound')
    sound_files = [f for f in os.listdir(sound_directory) if f.endswith('.mp3')]
    if sound_files:
        sound_path = os.path.join(sound_directory, random.choice(sound_files))
        playsound(sound_path)
    else:
        print('No sound files found in directory:', sound_directory)

if __name__ == '__main__':
    play_random_sound()
