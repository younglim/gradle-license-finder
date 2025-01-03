# gradle-license-finder
Checks dependencies from output of gradlew :app:dependencies and searches maven repository for license information

## Steps
- Set JAVA_HOME to an existing installation of JDK. For Android Studio on Mac, that is `export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"`
- Copy `gradle-find-dependencies.sh` and `mvn-query-licenses.sh` to the same directory as your gradle project.
- Run `./gradle-find-dependencies.sh` to query dependencies.
- Run `./mvn-query-licenses.sh` to get licenses to output in CSV.
