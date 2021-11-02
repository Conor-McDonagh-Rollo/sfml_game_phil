CXX			:= g++
CXXFLAGS 	:= -std=c++11 -Wall -Wextra -Werror -g -I.

MSG_START	:= "Build Started"
MSG_END		:= "Build Complete"
MSG_CLEAN	:= "Cleaning up"

LIBRARIES	:= -lsfml-graphics -lsfml-window -lsfml-system

BUILD_DIR	:= ./bin
SRC_DIR		:= ./src

TARGET		:= ${BUILD_DIR}/sampleapp.bin

SRC			:= ${SRC_DIR}/main.cpp ${SRC_DIR}/Game.cpp ${SRC_DIR}/Player.cpp ${SRC_DIR}/NPC.cpp ${SRC_DIR}/Character.cpp

all			:= build

build:
	@echo ${MSG_START}

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