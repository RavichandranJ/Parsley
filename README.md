#Parsley
Parsley is an application framework for Flex application. I choosen parsley because of its dependency injection and inverse of control nature. This helps to implement presentation model architeure in a better way.

##Dependency Injection and Inverse of Control
All the dependent objects will be configured in parsley context and can be injected in the applciation without creating new instance. This will help in having all the objects will be traeted as singleton class.

##Presentation Model
This is similar to spark component where the skin and logic will be seperated. For example View1.mxml will have only UI components and all the actionscript logic will be moved View1PM.ac class. This ways it is easy to manage view and logics. This also helps for unit testing.




