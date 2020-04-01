#/* !@file Makefile

#-----------------------------------------------------------------------
# Tools
export MAKE = "mingw32-make.exe"
export CMAKE = "cmake.exe"

#-----------------------------------------------------------------------
#
# Directory where the CMake configuration files are located
#
export SOLUTION_DIR 	?= $(shell pwd)
export CMAKE_CFG_DIR    := $(SOLUTION_DIR)/cmakescripts
export BIN_DIR          := $(SOLUTION_DIR)/bin
#export CMAKE_MODULE_DIR := $(CMAKE_CFG_DIR)/modules

BUILD_DIR := build 
BUILDTYPE := Release

#VisualStudio  := Visual Studio 12 2013
#cmake_generator = "$(VisualStudio) Win64"

cmake_generator = "MinGW Makefiles"
#cmake_generator = "MSYS Makefiles"

cmake_flags  += -DCMAKE_SH="CMAKE_SH-NOTFOUND"  #for mingw sh.exe found issue.
#cmake_flags += -D TARG_OS=$(TARG_OS)
#cmake_flags += -D TARG_CPU=$(TARG_CPU)
#cmake_flags += -D TARG_PLAT=$(TARG_PLAT) 
#cmake_flags += -D BUILDTYPE=$(BUILDTYPE)
#cmake_flags += -D ENABLE_UNIT_TEST=$(ENABLE_UNIT_TEST)

$(warning  ***********************************************************************************************)
$(warning  SOLUTION_DIR=$(SOLUTION_DIR))
$(warning  CMAKE_CFG_DIR=$(CMAKE_CFG_DIR))
$(warning  BIN_DIR=$(BIN_DIR))
$(warning  ***********************************************************************************************)


.PHONY: all
all: confgen 
	cd $(BUILD_DIR) && $(MAKE)
#-----------------------------------------------------------------------
#
# CMake configuration generation-only target
#
confgen: $(BUILD_DIR)
	echo "Starting the configuration generation..."
	cd $(BUILD_DIR) && cmake -G $(cmake_generator) $(CMAKE_CFG_DIR) $(cmake_flags) 
	echo "Done!" 

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)


.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)
	rm -rf $(BIN_DIR)
