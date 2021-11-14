# Added folling to deal with building on Windows or Linux
# For Windows the SFML_SDK Path Environment variable needs to be set.
# Practical Guide has instructions on how to set SFML_SDL env var.

BUILD_DIR	:= ./bin
SRC_DIR		:= ./src

ifeq ($(OS),Windows_NT)
    os  := Windows
    LIBRARIES	:= -L${SFML_SDK}\lib -Llibssfml-graphics -Llibssfml-window -Llibssfml-system
    CXXFLAGS 	:= -std=c++11 -DSFML_STATIC -Wall -Wextra -Werror -g -I${SFML_SDK}\include -I.
	TARGET		:= ${BUILD_DIR}/sampleapp.exe
else
    os := $(shell uname -s)
    LIBRARIES	:= -Lsfml-graphics -Lsfml-window -Lsfml-system
    CXXFLAGS 	:= -std=c++11 -Wall -Wextra -Werror -g -I.
	TARGET		:= ${BUILD_DIR}/sampleapp.bin
endif


CXX         := g++

MSG_START	:= "Build Started on "
MSG_END		:= "Build Complete"
MSG_CLEAN	:= "Cleaning up"

BUILD_DIR	:= ./bin
SRC_DIR		:= ./src

SRC		    := ${SRC_DIR}/main.cpp ${SRC_DIR}/Game.cpp ${SRC_DIR}/Player.cpp ${SRC_DIR}/NPC.cpp ${SRC_DIR}/Character.cpp

all		    := build

build:
	@echo ${MSG_START} ${os}

	@echo "***	C++ Compiler	***"
	@echo ${CXX}
	@echo "*** C++ Flags		***"
	@echo ${CXXFLAGS}
	@echo "*** LIBRARIES		***"
	@echo ${LIBRARIES}
	@echo "*** SRC		***"
	@echo ${SRC}
	@echo "*** LIBRARIES		***"
	@echo ${TARGET}

	#remove directory if it exits and then create directory
	rm -rf ${BUILD_DIR} || true

	#create bin directory
	mkdir ${BUILD_DIR}

	${CXX} ${CXXFLAGS} -o ${TARGET} ${SRC} ${LIBRARIES}
	@echo ${MSG_END}
	./${TARGET}

.PHONY: clean

clean:
	@echo ${MSG_CLEAN}
	rm -rf ${BUILD_DIR} || true