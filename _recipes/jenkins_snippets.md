---
name: Jenkins Snippets
---

# Jenkins Snippets

## Pipeline
### Basic Declerative Pipeline Structure (Minimal)
```
pipeline {
  agent { docker 'ruby:2.1' }
  stages {
    stage('build') {
      steps {
        sh 'ruby --version'
        sh 'bundle install'
      }
    }
  }
}
```

## Groovy
### Set ```GROOVY_HOME``` env variable
```export GROOVY_HOME=/usr/local/opt/groovy/libexec```
### Get groovy version running
1. Jenkins > Manage Nodes > <NODE NAME> Script Console
```
println GroovySystem.version
```

### Groovy Data Types
```byte``` − This is used to represent a byte value. An example is 2.  
```short``` − This is used to represent a short number. An example is 10.  
```int``` − This is used to represent whole numbers. An example is 1234.  
```long```− This is used to represent a long number. An example is 10000090.  
```float``` − This is used to represent 32-bit floating point numbers. An example is 12.34.  
```double``` − This is used to represent 64-bit floating point numbers which are longer decimal number representations which may be required at times. An example is 12.3456565.    
```char``` − This defines a single character literal. An example is ‘a’.  
```Boolean``` − This represents a Boolean value which can either be true or false.  
```String``` − These are text literals which are represented in the form of chain of characters. For example “Hello World”.


## Java JDK Needs
### Set ```JAVA_HOME``` env variable
In your *.bashrc* place the below line:  
```export JAVA_HOME=$(/usr/libexec/java_home)```

Extra options for ```java_home``` cmd:  
- ```java_home -V``` list all the available java versions  
- ```java_home -v 11.0.1``` specify which java version to select  
