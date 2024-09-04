cmake_minimum_required(VERSION 3.16)

project(WeatherApp VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appWeatherApp
    main.cpp
)

qt_add_qml_module(appWeatherApp
    URI WeatherApp
    VERSION 1.0
    QML_FILES Main.qml
    QML_FILES Wind.qml
    RESOURCES
    RESOURCES images/Arrow.png images/compass-2.png images/wind.png
    SOURCES controller.h controller.cpp
    QML_FILES Rain.qml
    RESOURCES images/air.png images/cloud.rain.png images/cloud.sun.png images/humidity.png images/pressure.png images/soil.png images/solar.png
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appWeatherApp PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appWeatherApp
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appWeatherApp
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appWeatherApp
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
