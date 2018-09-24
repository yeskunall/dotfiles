import os

HOME = os.path.expanduser("~")
VSCODE_EXTENSIONS_PATH = HOME + "/.vscode/extensions"
EXT_FILE_PATH = os.path.dirname(__file__) + "/extensions.txt"

if not os.path.isfile(EXT_FILE_PATH):
    open(EXT_FILE_PATH, 'w')
else:
    os.remove(EXT_FILE_PATH)

for name in os.listdir(VSCODE_EXTENSIONS_PATH):
    abs_path = VSCODE_EXTENSIONS_PATH + "/" + name
    if os.path.isdir(abs_path):
        with open(EXT_FILE_PATH, 'a') as f:
            f.writelines(name + '\n')
