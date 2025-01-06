import csv
import sys

def process_csv(input_csv, output_txt):
    with open(input_csv, mode='r', newline='', encoding='utf-8') as infile:
        csv_reader = csv.DictReader(infile)
        with open(output_txt, mode='w', newline='', encoding='utf-8') as outfile:
            for row in csv_reader:
                license = row['License(s)'] if 'License(s)' in row else 'No License Available'
                combined = row['Combined'] if 'Combined' in row else 'No Combined Available'
                terms = row['Terms'] if 'Terms' in row else 'No Terms Available'

                outfile.write(" " * 25 + "\n") 
                outfile.write(f"{license}\n")
                outfile.write("-" * 33 + "\n")  # 33 hyphens for the line
                outfile.write(f"{combined}\n\n")
                outfile.write(" " * 25 + "\n") 
                outfile.write(f"{terms}\n\n\n")
                outfile.write("=" * 25 + "\n")  # 25 equals for the line

def main():
    if len(sys.argv) < 3:
        print("Usage: python script.py <input_csv> <output_txt>")
        sys.exit(1)

    input_csv = sys.argv[1]
    output_txt = sys.argv[2]

    process_csv(input_csv, output_txt)
    print(f"Export completed successfully! Output written to {output_txt}")

if __name__ == '__main__':
    main()
