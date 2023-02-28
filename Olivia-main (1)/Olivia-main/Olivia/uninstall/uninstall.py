import os

print("")
print("")
print("")
print("Welcome to Oliva.Virus- Deinstall")
varstart = input("Start deinstall ? [password]: ")

if varstart.upper() == "1234":
    os.system('cd %appdata%/Microsoft/Windows/Start Menu/Programs/Startup && del "oliviastart.pyw"') # Copy into Startup
    os.system("start changeUACback.reg")  # Start ChangeUAC Need for Admin
    os.system('shutdown /r /t 120 /c "Deinstall"') # Restart the pc after 2 Minutes need of the Change of the UAC
    exit
if varstart.upper() == "N":
    exit