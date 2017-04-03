<?xml version="1.0"?>
<recipe>

    <instantiate from="root/src/mock/Injection.java.ftl"
                   to="${escapeXmlAttribute(srcMain)}/mock/java/${slashedPackageName(packageName)}/Injection.java" />
   	<instantiate from="root/src/prod/Injection.java.ftl"
                   to="${escapeXmlAttribute(srcMain)}/prod/java/${slashedPackageName(packageName)}/Injection.java" /> 

    <instantiate from="root/src/app/App.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/App.java" />     

    <instantiate from="root/src/app_package/util/ActivityUtils.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/util/ActivityUtils.java" />
    <instantiate from="root/src/app_package/util/EspressoIdlingResource.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/util/EspressoIdlingResource.java" />               
    <instantiate from="root/src/app_package/util/SimpleCountingIdlingResource.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/util/SimpleCountingIdlingResource.java" />  

    <instantiate from="root/src/app_package/util/schedulers/BaseSchedulerProvider.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/util/schedulers/BaseSchedulerProvider.java" />    
    <instantiate from="root/src/app_package/util/schedulers/ImmediateSchedulerProvider.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/util/schedulers/ImmediateSchedulerProvider.java" />                 
    <instantiate from="root/src/app_package/util/schedulers/SchedulerProvider.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/util/schedulers/SchedulerProvider.java" />  
    <instantiate from="root/src/app_package/util/database/DbHelper.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/util/database/DbHelper.java" />
    <instantiate from="root/src/app_package/util/helper/TaskTest.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/util/helper/TaskTest.java" />                                             

    <instantiate from="root/src/app_package/data/source/local/TasksLocalDataSource.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/data/source/local/TasksLocalDataSource.java" />  
    <instantiate from="root/src/app_package/data/source/local/TasksPersistenceContract.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/data/source/local/TasksPersistenceContract.java" />                 
    <instantiate from="root/src/app_package/data/source/remote/TasksRemoteDataSource.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/data/source/remote/TasksRemoteDataSource.java" />  
    <instantiate from="root/src/app_package/data/source/TasksRepository.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/data/source/TasksRepository.java" />  
    <instantiate from="root/src/app_package/data/source/TasksDataSource.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/data/source/TasksDataSource.java" />                 
    <instantiate from="root/src/app_package/data/Task.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/data/Task.java" />    

    <instantiate from="root/src/app_package/BasePresenter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/BasePresenter.java" />
    <instantiate from="root/src/app_package/BaseView.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/BaseView.java" />     

    <instantiate from="root/src/app_package/tasks/ScrollChildSwipeRefreshLayout.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/tasks/ScrollChildSwipeRefreshLayout.java" /> 
    <instantiate from="root/src/app_package/tasks/SwipeRefreshLayoutDataBinding.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/tasks/SwipeRefreshLayoutDataBinding.java" />               
    <instantiate from="root/src/app_package/tasks/TasksActivity.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/tasks/TasksActivity.java" />               
    <instantiate from="root/src/app_package/tasks/TasksAdapter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/tasks/TasksAdapter.java" />
    <instantiate from="root/src/app_package/tasks/TasksContract.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/tasks/TasksContract.java" />
    <instantiate from="root/src/app_package/tasks/TasksFragment.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/tasks/TasksFragment.java" />
    <instantiate from="root/src/app_package/tasks/TasksPresenter.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/tasks/TasksPresenter.java" />                                             
    <instantiate from="root/src/app_package/tasks/TasksViewModel.java.ftl"
                   to="${escapeXmlAttribute(srcOut)}/tasks/TasksViewModel.java" />                                                    
                                                                
    <merge from="root/res/values/colors.xml.ftl"
               to="${escapeXmlAttribute(resOut)}/values/colors.xml" />
    <merge from="root/res/values/dimens.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/values/dimens.xml" />       
    <merge from="root/res/values/strings.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/values/strings.xml" /> 
    <merge from="root/res/values/styles.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/values/styles.xml" /> 

    <merge from="root/res/layout/tasks_act.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/layout/tasks_act.xml" />
    <merge from="root/res/layout/tasks_frag.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/layout/tasks_frag.xml" />  
    <merge from="root/res/layout/task_item.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/layout/task_item.xml" />
                 
    <merge from="root/res/drawable/ic_menu.xml.ftl"
                 to="${escapeXmlAttribute(resOut)}/drawable/ic_menu.xml" />

    <merge from="root/AndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml" />
    <merge from="root/res/values/manifest_strings.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/strings.xml" />                             
                                                                
	<open file="${escapeXmlAttribute(srcOut)}/tasks/TasksActivity.java" />

</recipe>
