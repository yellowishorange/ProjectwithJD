import os
import subprocess
import time
import playsound
import website

# Get the directory path of the current script file
script_dir = os.path.dirname(os.path.abspath(__file__))

while True:
    # Construct the full paths of the programs using the script directory path
    blockuser_path = os.path.join(script_dir, "blockuser.pyw")
    change_wallpaper_path = os.path.join(script_dir, "change_wallpaper.pyw")
    popup_path = os.path.join(script_dir, "popup.pyw")

    subprocess.Popen(f"{blockuser_path} 0", shell=True)
    subprocess.Popen(f"{change_wallpaper_path} 0", shell=True)
    os.system(f"start {popup_path}")
    website.websitestart()
    playsound.opensound()
    time.sleep(120)  # Wait for 2 minutes