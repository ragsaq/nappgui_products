cmake_minimum_required(VERSION 3.0)

project(Products LANGUAGES C)

find_package(nappgui REQUIRED)

add_executable(${PROJECT_NAME} WIN32 prctrl.c prctrl.h prmenu.c prmenu.h prmodel.c prmodel.h products.c products.hxx prview.c prview.h)

target_include_directories(${PROJECT_NAME} PRIVATE ${NAPPGUI_INCLUDES})
target_link_libraries(${PROJECT_NAME} PRIVATE ${NAPPGUI_LIBRARIES})

# we should use:
# nap_desktop_app(Products "osapp;inet" NRC_PACKED)
# set_target_properties(${PROJECT_NAME} PROPERTIES FOLDER "demo")
