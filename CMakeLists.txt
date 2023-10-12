cmake_minimum_required(VERSION 3.18)

project(qmlUi_Demo
  VERSION
    1.0
  DESCRIPTION
    "Qt QML Examples"
  LANGUAGES
    CXX
)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

if(CMAKE_VERSION VERSION_LESS "3.7.0")
    set(CMAKE_INCLUDE_CURRENT_DIR ON)
endif()

find_package(Qt5 COMPONENTS Widgets REQUIRED)
find_package(Qt5Charts REQUIRED)
find_package(Qt5 COMPONENTS Core Quick Sql Charts Multimedia REQUIRED)

set(SRC_FILES
		main.cpp 
		helper.cpp 
    		reader.cpp 
    		filecheck.cpp
    		mydatabase.cpp
		)

set(HEADER_FILES
		helper.h 
    		reader.h 
    		filecheck.h 
    		mydatabase.h
		)
		
		
set(QRC_FILES
		icons.qrc
    		qt_qml.qrc
		)
		
#set(QMLS_FILE
#		qmls/BottomBar.qml
#		)
#
#qt_add_qml_module(${PROJECT_NAME}
#    URI ${PROJECT_NAME}
#    VERSION 1.0
#    QML_FILES
#        main.qml
#        FramedImage.qml
#        )

add_executable(${PROJECT_NAME} ${SRC_FILES} ${HEADER_FILES} ${QRC_FILES})

add_definitions(-DQT_NO_VERSION_TAGGING)

target_link_libraries(${PROJECT_NAME} Qt5::Widgets Qt5::Gui Qt5::Quick Qt5::Charts)


qt5_use_modules(${PROJECT_NAME} Core Sql Xml Charts Quick Multimedia)

include_directories(.)
