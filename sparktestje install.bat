rem https://chocolatey.org/
@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
choco install jdk -y
choco install sbt -y
rem http://scalatutorials.com/beginner/2013/07/18/getting-started-with-sbt/
rem http://spark.apache.org/docs/latest/quick-start.html
cd c:
mkdir source
cd source
mkdir sparktest
cd sparktest
mkdir src\main\scala
cd src\main\scala
echo /* SimpleApp.scala */ > SimpleApp.scala
echo import org.apache.spark.SparkContext >> SimpleApp.scala
echo import org.apache.spark.SparkContext._ >> SimpleApp.scala
echo import org.apache.spark.SparkConf >> SimpleApp.scala
echo object SimpleApp { >> SimpleApp.scala
echo   def main(args: Array[String]) { >> SimpleApp.scala
echo     val logFile = "C:/source/sparktest/src/main/scala/SimpleApp.scala" // Should be some file on your system >> SimpleApp.scala
echo     val conf = new SparkConf().setAppName("Simple Application").setMaster("local") >> SimpleApp.scala
echo     val sc = new SparkContext(conf) >> SimpleApp.scala
echo     val logData = sc.textFile(logFile, 2).cache() >> SimpleApp.scala
echo     val numAs = logData.filter(line =^> line.contains("a")).count() >> SimpleApp.scala
echo     val numBs = logData.filter(line =^> line.contains("b")).count() >> SimpleApp.scala
echo     println("Lines with a: %s, Lines with b: %s".format(numAs, numBs)) >> SimpleApp.scala
echo   } >> SimpleApp.scala
echo } >> SimpleApp.scala
cd ..\..\..
echo name := "simple spark" > build.sbt
echo version := "1.0"  >> build.sbt
echo scalaVersion := "2.10.5" >> build.sbt
echo libraryDependencies += "org.apache.spark" %%%% "spark-core" %% "1.6.1" >> build.sbt
sbt run