// Top-level build file where you can add configuration options common to all sub-projects/modules.

buildscript {
    repositories {
        google()
        jcenter()
    }

    dependencies {
        // The classpath for the plugin is added here
        classpath("com.android.tools.build:gradle:8.2.0")
    }
}

plugins {
    id("com.android.application") version "8.2.0" apply false
}

allprojects {
    repositories {
        google()
        jcenter()
    }
}

task clean(type: Delete) {
    delete rootProject.buildDir
}
