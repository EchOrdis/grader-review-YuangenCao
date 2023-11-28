CPATH= '.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
if [[ -f student-submission/Listexamples.java ]]
then 
    echo 'File existed'
else
    echo 'Error'
fi

found=$(find -name "ListExamples.java")

cp ${found} grading-area
cp TestListExamples.java grading-area
cp -r lib grading-area

cd grading-area

javac -cp $CPATH *.java 2>&1 | tee compile.txt

if [[ $? -eq 0 ]]
then
    echo 'Compile pass'
else
    echo 'Error'
fi



java -cp $CPATH org.junit.runner.JUnitCore TestListExamples >test_result.txt
