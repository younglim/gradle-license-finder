# gradle-license-finder
Checks dependencies from output of gradlew :app:dependencies and searches maven repository for license information

## Steps
- Set JAVA_HOME to an existing installation of JDK. For Android Studio on Mac, that is `export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"`
- Copy `gradle-find-dependencies.sh` and `mvn-query-licenses.sh` to the same directory as your gradle project.
- Run `./gradle-find-dependencies.sh` to query dependencies.
- Run `./mvn-query-licenses.sh` to get licenses to output in CSV.

## Additional steps to Format License Information
1. **Install Python 3:**
   - Run the following command to install Python 3:
     ```bash
     brew install python
     ```
2. **Edit the `license_report.csv`:**
   - Open the `license_report.csv` file.
   - Go to the `Package_URL` column in the file and visit the URL for each package.
   - Find the full license text at the bottom of the page.
   - Copy the license text and paste it into the corresponding row in the `License Text` column.
3. **Format the CSV into a LICENSE Text File:**
   - Once you've updated the CSV file, run the following command to format it into a LICENSE text file:
     ```bash
     python3 license-formatter.py <input file> <output file>
     ```
   - For example, if your input file is `third-party-license-graddle.csv` and you want the output file to be `LICENSE`, run:
     ```bash
     python3 license-formatter.py third-party-license-graddle.csv LICENSE
     ```
This will generate the LICENSE text file based on the information in the CSV file.

## Example/Current Files
1. **[dependencies_linear_deduplicated.txt]**  
   This file contains the dependencies extracted from Gradle.
2. **[third-party-license-graddle.csv]**  
   This file includes the license text that is filled in for each third-party dependency.
3. **[LICENSE]**  
   This is the full license file to be included in your repository.

