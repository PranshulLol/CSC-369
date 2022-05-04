@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem

@if "%DEBUG%" == "" @echo off
@rem ##########################################################################
@rem
@rem  hadoop-example1 startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and HADOOP_EXAMPLE1_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if "%ERRORLEVEL%" == "0" goto execute

echo.
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo.
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
echo.
echo Please set the JAVA_HOME variable in your environment to match the
echo location of your Java installation.

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\hadoop-example1.jar;%APP_HOME%\lib\hadoop-client-2.10.1.jar;%APP_HOME%\lib\mrunit-1.1.0-hadoop2.jar;%APP_HOME%\lib\log4j-core-2.14.1.jar;%APP_HOME%\lib\log4j-api-2.14.1.jar;%APP_HOME%\lib\hadoop-mapreduce-client-app-2.10.1.jar;%APP_HOME%\lib\hadoop-mapreduce-client-jobclient-2.10.1.jar;%APP_HOME%\lib\hadoop-mapreduce-client-shuffle-2.10.1.jar;%APP_HOME%\lib\hadoop-yarn-server-nodemanager-2.10.1.jar;%APP_HOME%\lib\hadoop-yarn-server-common-2.10.1.jar;%APP_HOME%\lib\hadoop-yarn-registry-2.10.1.jar;%APP_HOME%\lib\hadoop-common-2.10.1.jar;%APP_HOME%\lib\hadoop-hdfs-client-2.10.1.jar;%APP_HOME%\lib\hadoop-mapreduce-client-common-2.10.1.jar;%APP_HOME%\lib\hadoop-mapreduce-client-core-2.10.1.jar;%APP_HOME%\lib\hadoop-yarn-client-2.10.1.jar;%APP_HOME%\lib\hadoop-yarn-common-2.10.1.jar;%APP_HOME%\lib\hadoop-yarn-api-2.10.1.jar;%APP_HOME%\lib\hadoop-annotations-2.10.1.jar;%APP_HOME%\lib\powermock-module-junit4-1.5.1.jar;%APP_HOME%\lib\powermock-module-junit4-common-1.5.1.jar;%APP_HOME%\lib\junit-4.11.jar;%APP_HOME%\lib\hadoop-auth-2.10.1.jar;%APP_HOME%\lib\jets3t-0.9.0.jar;%APP_HOME%\lib\httpclient-4.5.2.jar;%APP_HOME%\lib\commons-configuration-1.6.jar;%APP_HOME%\lib\commons-digester-1.8.jar;%APP_HOME%\lib\commons-beanutils-1.9.4.jar;%APP_HOME%\lib\commons-logging-1.2.jar;%APP_HOME%\lib\mockito-core-1.9.5.jar;%APP_HOME%\lib\curator-recipes-2.13.0.jar;%APP_HOME%\lib\curator-framework-2.13.0.jar;%APP_HOME%\lib\curator-client-2.13.0.jar;%APP_HOME%\lib\guava-16.0.1.jar;%APP_HOME%\lib\powermock-api-mockito-1.5.1.jar;%APP_HOME%\lib\powermock-api-support-1.5.1.jar;%APP_HOME%\lib\powermock-core-1.5.1.jar;%APP_HOME%\lib\commons-cli-1.2.jar;%APP_HOME%\lib\commons-math3-3.1.1.jar;%APP_HOME%\lib\xmlenc-0.52.jar;%APP_HOME%\lib\commons-codec-1.9.jar;%APP_HOME%\lib\commons-io-2.4.jar;%APP_HOME%\lib\commons-net-3.1.jar;%APP_HOME%\lib\commons-collections-3.2.2.jar;%APP_HOME%\lib\jetty-sslengine-6.1.26.jar;%APP_HOME%\lib\jsp-api-2.1.jar;%APP_HOME%\lib\zookeeper-3.4.14.jar;%APP_HOME%\lib\slf4j-log4j12-1.7.25.jar;%APP_HOME%\lib\log4j-1.2.17.jar;%APP_HOME%\lib\commons-lang-2.6.jar;%APP_HOME%\lib\commons-lang3-3.4.jar;%APP_HOME%\lib\avro-1.7.7.jar;%APP_HOME%\lib\apacheds-kerberos-codec-2.0.0-M15.jar;%APP_HOME%\lib\apacheds-i18n-2.0.0-M15.jar;%APP_HOME%\lib\api-asn1-api-1.0.0-M20.jar;%APP_HOME%\lib\api-util-1.0.0-M20.jar;%APP_HOME%\lib\ehcache-3.3.1.jar;%APP_HOME%\lib\HikariCP-java7-2.4.12.jar;%APP_HOME%\lib\metrics-core-3.0.1.jar;%APP_HOME%\lib\slf4j-api-1.7.25.jar;%APP_HOME%\lib\jersey-json-1.9.jar;%APP_HOME%\lib\jackson-jaxrs-1.9.13.jar;%APP_HOME%\lib\jackson-xc-1.9.13.jar;%APP_HOME%\lib\jackson-mapper-asl-1.9.13.jar;%APP_HOME%\lib\jackson-core-asl-1.9.13.jar;%APP_HOME%\lib\protobuf-java-2.5.0.jar;%APP_HOME%\lib\gson-2.2.4.jar;%APP_HOME%\lib\spotbugs-annotations-3.1.9.jar;%APP_HOME%\lib\jsr305-3.0.2.jar;%APP_HOME%\lib\htrace-core4-4.1.0-incubating.jar;%APP_HOME%\lib\commons-compress-1.19.jar;%APP_HOME%\lib\woodstox-core-5.0.3.jar;%APP_HOME%\lib\stax2-api-3.1.4.jar;%APP_HOME%\lib\okhttp-2.7.5.jar;%APP_HOME%\lib\jaxb-impl-2.2.3-1.jar;%APP_HOME%\lib\jaxb-api-2.2.2.jar;%APP_HOME%\lib\hamcrest-core-1.3.jar;%APP_HOME%\lib\powermock-reflect-1.5.1.jar;%APP_HOME%\lib\objenesis-1.2.jar;%APP_HOME%\lib\javassist-3.18.0-GA.jar;%APP_HOME%\lib\httpcore-4.4.4.jar;%APP_HOME%\lib\paranamer-2.3.jar;%APP_HOME%\lib\snappy-java-1.0.5.jar;%APP_HOME%\lib\nimbus-jose-jwt-7.9.jar;%APP_HOME%\lib\jline-0.9.94.jar;%APP_HOME%\lib\audience-annotations-0.5.0.jar;%APP_HOME%\lib\netty-3.10.6.Final.jar;%APP_HOME%\lib\okio-1.6.0.jar;%APP_HOME%\lib\leveldbjni-all-1.8.jar;%APP_HOME%\lib\stax-api-1.0-2.jar;%APP_HOME%\lib\activation-1.1.jar;%APP_HOME%\lib\servlet-api-2.5.jar;%APP_HOME%\lib\jetty-6.1.26.jar;%APP_HOME%\lib\jetty-util-6.1.26.jar;%APP_HOME%\lib\jersey-client-1.9.jar;%APP_HOME%\lib\jersey-guice-1.9.jar;%APP_HOME%\lib\jersey-server-1.9.jar;%APP_HOME%\lib\jersey-core-1.9.jar;%APP_HOME%\lib\guice-3.0.jar;%APP_HOME%\lib\jcip-annotations-1.0-1.jar;%APP_HOME%\lib\json-smart-2.3.jar;%APP_HOME%\lib\geronimo-jcache_1.0_spec-1.0-alpha-1.jar;%APP_HOME%\lib\mssql-jdbc-6.2.1.jre7.jar;%APP_HOME%\lib\jettison-1.1.jar;%APP_HOME%\lib\javax.inject-1.jar;%APP_HOME%\lib\aopalliance-1.0.jar;%APP_HOME%\lib\cglib-2.2.1-v20090111.jar;%APP_HOME%\lib\asm-3.1.jar;%APP_HOME%\lib\accessors-smart-1.2.jar;%APP_HOME%\lib\asm-5.0.4.jar;%APP_HOME%\lib\jsch-0.1.55.jar;%APP_HOME%\lib\java-xmlbuilder-0.4.jar


@rem Execute hadoop-example1
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %HADOOP_EXAMPLE1_OPTS%  -classpath "%CLASSPATH%" csc369.HadoopApp %*

:end
@rem End local scope for the variables with windows NT shell
if "%ERRORLEVEL%"=="0" goto mainEnd

:fail
rem Set variable HADOOP_EXAMPLE1_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
if  not "" == "%HADOOP_EXAMPLE1_EXIT_CONSOLE%" exit 1
exit /b 1

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
