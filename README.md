# gradle-license-finder
Checks dependencies from output of gradlew :app:dependencies and searches maven repository for license information

## Steps
- Set JAVA_HOME to an existing installation of JDK. For Android Studio on Mac, that is `export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"`
- Copy `gradle-find-dependencies.sh` and `mvn-query-licenses.sh` to the same directory as your gradle project.
- Run `./gradle-find-dependencies.sh` to query dependencies.
- Run `./mvn-query-licenses.sh` to get licenses to output in CSV.

## Additional Stepts
- Download and install python3 `brew install python`
- Edit the license_report.csv to include the fully license text by going to the Package_URL
- License text can be found in the link at the bottom, fill in the terms with the License Text
- Run `python3 license-formatter.py <your input file> <your output file>` to format the output CSV into a LICENSE text file.
- e.g. `python3 license-formatter.py third-party-license-graddle.csv LICENSE`

## Example/Current Files
1. **[dependencies_linear_deduplicated.txt]**  
   This file contains the dependencies extracted from Gradle.
2. **[third-party-license-graddle.csv]**  
   This file includes the license text that is filled in for each third-party dependency.
3. **[LICENSE]**  
   This is the full license file to be included in your repository.

