---
layout: post
title:  "Jenkins Multibranch Pipeline Template"
categories: jenkins ci devops
tags: ci devops jenkins 
---

Jenkins Declerative pipeline which can be used to manage a multibranch source control workflow.

Highlights:
* Conditional builds based on branch properties
* Conditional agent selection
* Conditional stage exectution

{% highlight groovy %}
  // Two branch example
  DEV_BRANCH = "develop"
  PROD_BRANCH = "master"

// Dynamically set the build agent based on some condition (branch name in this case)
def agentLabel 
  if (BRANCH_NAME == PROD_BRANCH) {
      agentLabel = "agent_name_1"
  } else {
      agentLabel = "agent_name_2"
  }

pipeline {
  agent { label agentLabel }
  environment { // Set environment variables
    PATH = "/home/user/bin:${env.PATH}"
  }
  options { // Set build options
    disableConcurrentBuilds()
    buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '15')
    disableResume()
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    stage('Build') {
      steps {
        // Exec bash/any script
        script {
          if (BRANCH_NAME != PROD_BRANCH) {
            echo "( BUILD STAGE OTHER )"
          } else if (BRANCH_NAME == PROD_BRANCH) {
            echo "( BUILD STAGE PROD)"
          } else {
            echo "( BUILD STAGE - Condition NOT met )"
          }
        }
      }
    }

    stage('Unit Test') {
      steps {
        script {
          if (BRANCH_NAME != PROD_BRANCH) {
            echo "( UNIT TESTS OTHER )"
          } else if (BRANCH_NAME == PROD_BRANCH) {
            echo "( UNIT TESTS PROD)"
          } else {
            echo "( UNIT TESTS - Condition NOT met )"
          }
        }
      }
    }

    stage('Static Analysis') { // SonarQube static code analysis stage
      when { // When clause based on branch name. This stage is entered only when the branch name matches
        branch DEV_BRANCH
      }
      environment { // Setting specific to SonarQube
        scannerHome = tool name: '<tool name>', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
      }
      // Add sonar/any tools using pipeline generator
      steps {
        script {
          if (BRANCH_NAME == DEV_BRANCH) {
            echo "( STATIC ANALYSIS DEV)"
          } else if (BRANCH_NAME == PROD_BRANCH) {
            echo "( STATIC ANALYSIS PROD)"
          } else {
            echo "( STATIC ANALYSIS - Condition NOT met )"
          }
        }
      }
    }

    stage('Integration Test') {
      steps {
        script {
          if (BRANCH_NAME != PROD_BRANCH) {
            echo " (INTEGRATION TEST OTHER )"
          } else if (BRANCH_NAME == PROD_BRANCH) {
            echo " (INTEGRATION TEST PROD )"
          } else {
            echo " (INTEGRATION TEST - Condition NOT met )"
          }
        }
      }
    }

    stage('Deploy') {
      when { anyOf {  // When clause based on branch name. This stage is entered only when the branch name matches
          branch DEV_BRANCH; branch PROD_BRANCH
        } 
      }
      steps {
        script {
          if (BRANCH_NAME == DEV_BRANCH) {
            echo "( DEPLOYING DEV )"
          } else if (BRANCH_NAME == PROD_BRANCH) {
            echo "( DEPLOYING PROD )"
          } else {
            echo "( DEPLOYING - Condition NOT met )"
          }
        } 
      }
    }

  }

  post {
    cleanup { // Clean up stage gets executed no matter what. Do any cleanup here.
      sh "<cleanup script>"
    }
    success { // Collect artifacts upon successful build.
      junit '<unit test reports>'
    }
  }
}

{% endhighlight %}
