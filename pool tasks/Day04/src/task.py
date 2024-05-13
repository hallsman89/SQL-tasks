# файл запускается из src
# python3 task.py 
# можно сначала проверить из тестовой папки
# удалить все что создалось можно командой: find . -mindepth 1 ! -name 'task.py' -delete
# !!!удалит все кроме task.py в директории из которой запускается!!!

import re
import os

with open('../README.md', 'r') as readme_file:
    readme_data = readme_file.read()

exercises = re.split(r'(?m)^## Exercise', readme_data)[1:]

for exercise in exercises:
    lines = exercise.split('\n')
    lines = ['-- ' + line for line in lines if not line.startswith('## Chapter')]

    turn_in_directory = re.search(r'Turn-in directory\s+\|\s+([^|]+)', exercise).group(1).strip()
    files_to_turn_in = re.search(r'Files to turn-in\s+\|\s+(`[^|]+`)', exercise).group(1).strip().replace('`', '')

    exercise_text = '\n'.join(lines[1:]).strip()

    file_content = f"\n{exercise_text}"

    if not os.path.exists(turn_in_directory):
        os.makedirs(turn_in_directory)

    file_name = f"{turn_in_directory}/{files_to_turn_in}"
    if os.path.isfile(file_name):
        print(f"Файл {file_name} уже существует.")
    else:
        with open(file_name, 'w') as exercise_file:
           exercise_file.write(file_content)


