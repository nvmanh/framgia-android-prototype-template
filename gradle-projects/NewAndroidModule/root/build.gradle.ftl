<#if isFramgiaMVP!false>
import org.gradle.api.tasks.testing.logging.TestExceptionFormat
import org.gradle.api.tasks.testing.logging.TestLogEvent
</#if>
<#if !(perModuleRepositories??) || perModuleRepositories>
buildscript {
    repositories {
        jcenter()
<#if mavenUrl != "mavenCentral">
        maven {
            url '${mavenUrl}'
        }
</#if>
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:${gradlePluginVersion}'
    }
}
</#if>
<#if isInstantApp!false>
    <#if isLibraryProject!false>
apply plugin: 'com.android.atom'
    <#else>
apply plugin: 'com.android.instantapp'
    </#if>
<#else>
    <#if isLibraryProject!false>
apply plugin: 'com.android.library'
    <#else>
apply plugin: 'com.android.application'
    </#if>
</#if>
<#if !(perModuleRepositories??) || perModuleRepositories>

repositories {
        jcenter()
<#if mavenUrl != "mavenCentral">
        maven {
            url '${mavenUrl}'
        }
</#if>
}
</#if>

android {
    compileSdkVersion <#if buildApiString?matches("^\\d+$")>${buildApiString}<#else>'${buildApiString}'</#if>
    buildToolsVersion '${buildToolsVersion}'

    defaultConfig {
    <#if !(isLibraryProject!false) && !(isInstantApp!false)>
    applicationId "${packageName}"
    </#if>
        minSdkVersion <#if minApi?matches("^\\d+$")>${minApi}<#else>'${minApi}'</#if>
        targetSdkVersion <#if targetApiString?matches("^\\d+$")>${targetApiString}<#else>'${targetApiString}'</#if>
        versionCode 1
        versionName "1.0"
        testInstrumentationRunner "android.support.test.runner.AndroidJUnitRunner"

    <#if includeCppSupport!false && cppFlags != "">
        externalNativeBuild {
            cmake {
                cppFlags "${cppFlags}"
            }
        }
    </#if>
    }
<#if javaVersion?? && (javaVersion != "1.6" && buildApi lt 21 || javaVersion != "1.7")>

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_${javaVersion?replace('.','_','i')}
        targetCompatibility JavaVersion.VERSION_${javaVersion?replace('.','_','i')}
    }
</#if>
<#if enableProGuard>
    buildTypes {
        debug {
          minifyEnabled false
          // Uses new built-in shrinker http://tools.android.com/tech-docs/new-build-system/built-in-shrinker
          useProguard false
          proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
          testProguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguardTest-rules.pro'
        }

        release {
          minifyEnabled true
          useProguard true
          proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
          testProguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguardTest-rules.pro'
        }
    }
</#if>

<#if includeCppSupport!false>
    externalNativeBuild {
        cmake {
            path "CMakeLists.txt"
        }
    }
</#if>
<#if isFramgiaMVP!false>
    // If you need to add more flavors, consider using flavor dimensions.
    productFlavors {
        mock {
          applicationIdSuffix = ".mock"
        }
        prod {}
    }

    // Remove mockRelease as it's not needed.
    android.variantFilter { variant ->
        if (variant.buildType.name.equals('release') && variant.getFlavors().
            get(0).name.
            equals('mock')) {
          variant.setIgnore(true);
        }
    }

    // Always show the result of every unit test, even if it passes.
    testOptions.unitTests.all {
        testLogging {
          // set options for log level LIFECYCLE
           events TestLogEvent.PASSED, TestLogEvent.SKIPPED, TestLogEvent.FAILED, TestLogEvent.STANDARD_OUT
           showExceptions true
           exceptionFormat TestExceptionFormat.FULL
           showCauses true
           showStackTraces true

            // set options for log level DEBUG and INFO
           debug {
            events TestLogEvent.STARTED, TestLogEvent.PASSED, TestLogEvent.SKIPPED, TestLogEvent.FAILED, TestLogEvent.STANDARD_OUT, TestLogEvent.STANDARD_ERROR
            exceptionFormat TestExceptionFormat.FULL
           }
           info.events = debug.events
           info.exceptionFormat = debug.exceptionFormat
        }
    }
    dataBinding {
        enabled = true
    }
</#if>
}

dependencies {
<#if isFramgiaMVP!true>
    <#if isLibraryProject || !(isInstantApp!false)>
        compile fileTree(dir: 'libs', include: ['*.jar'])
        androidTestCompile('com.android.support.test.espresso:espresso-core:${espressoVersion!"2.0"}', {
            exclude group: 'com.android.support', module: 'support-annotations'
        })
        
        <#if WearprojectName?has_content && NumberOfEnabledFormFactors?has_content && NumberOfEnabledFormFactors gt 1 && Wearincluded>
        wearApp project(':${WearprojectName}')
        compile 'com.google.android.gms:play-services-wearable:+'
        </#if>
    <#elseif alsoCreateIapk!false>
        compile project(':${atomName}')
    </#if>
</#if>
<#if isFramgiaMVP!false>

    <#if WearprojectName?has_content && NumberOfEnabledFormFactors?has_content && NumberOfEnabledFormFactors gt 1 && Wearincluded>
        wearApp project(':${WearprojectName}')
        compile 'com.google.android.gms:play-services-wearable:+'
    </#if>    

    compile "com.android.support:appcompat-v7:<#if targetApiString?matches("^\\d+$")>${targetApiString}<#else>'${targetApiString}'</#if>.+"
    compile "com.android.support:cardview-v7:<#if targetApiString?matches("^\\d+$")>${targetApiString}<#else>'${targetApiString}'</#if>.+"
    compile "com.android.support:design:<#if targetApiString?matches("^\\d+$")>${targetApiString}<#else>'${targetApiString}'</#if>.+"
    compile "com.android.support:recyclerview-v7:<#if targetApiString?matches("^\\d+$")>${targetApiString}<#else>'${targetApiString}'</#if>.+"
    compile "com.android.support:support-v4:<#if targetApiString?matches("^\\d+$")>${targetApiString}<#else>'${targetApiString}'</#if>.+"
    compile "com.android.support.test.espresso:espresso-idling-resource:2.2.2"
    compile "com.google.guava:guava:18.0"
    compile "io.reactivex:rxjava:1.1.8"
    compile "io.reactivex:rxandroid:1.2.1"
    compile 'com.squareup.sqlbrite:sqlbrite:0.7.0'

    testCompile "junit:junit:4.12"
    testCompile "org.mockito:mockito-all:1.10.19"
    testCompile "org.hamcrest:hamcrest-all:1.3"

    androidTestCompile "com.android.support.test:runner:0.5"
    androidTestCompile "com.android.support.test:rules:0.5"

    androidTestCompile "junit:junit:4.12"
    androidTestCompile "org.mockito:mockito-core:1.10.19"
    androidTestCompile "com.google.dexmaker:dexmaker:1.2"
    androidTestCompile "com.google.dexmaker:dexmaker-mockito:1.2"

    androidTestCompile "com.android.support.test.espresso:espresso-core:2.2.2"
    androidTestCompile "com.android.support.test.espresso:espresso-contrib:2.2.2"
    androidTestCompile "com.android.support.test.espresso:espresso-intents:2.2.2"

    androidTestCompile "com.android.support:support-annotations:<#if targetApiString?matches("^\\d+$")>${targetApiString}<#else>'${targetApiString}'</#if>.+"
    androidTestCompile "com.android.support:support-v4:<#if targetApiString?matches("^\\d+$")>${targetApiString}<#else>'${targetApiString}'</#if>.+"
    androidTestCompile "com.android.support:recyclerview-v7:<#if targetApiString?matches("^\\d+$")>${targetApiString}<#else>'${targetApiString}'</#if>.+"
    androidTestCompile "com.android.support:appcompat-v7:<#if targetApiString?matches("^\\d+$")>${targetApiString}<#else>'${targetApiString}'</#if>.+"
    androidTestCompile "com.android.support:design:<#if targetApiString?matches("^\\d+$")>${targetApiString}<#else>'${targetApiString}'</#if>.+"
</#if>
}
