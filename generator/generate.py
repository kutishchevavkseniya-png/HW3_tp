import csv
import random
import os
import sys

NUM_ROWS = 50


COLUMNS = ["STUDENT_NUMBER", "DICRETE_MATH_GRADE", "STUDENT'S_APPEARANCE_GRATE", "STUDENT'S_CLASS"]

def generate_row():

    return {
        "STUDENT_NUMBER": random.randint(0, 100),
        "DICRETE_MATH_GRADE": round(random.uniform(1.5, 9.9), 2),
        "STUDENT'S_APPEARANCE_GRATE": random.randint(0, 100),
        "STUDENT'S_CLASS": random.choice(["A", "B", "C"]),
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)

