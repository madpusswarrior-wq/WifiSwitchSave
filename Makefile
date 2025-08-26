# Minimal libnx Makefile — CI safe

TARGET      := SwitchSync
BUILD       := build
SOURCES     := source
INCLUDES    := include

APP_TITLE   := SwitchSync
APP_AUTHOR  := You
APP_VERSION := 0.1.0

# Compile flags
CFLAGS      := -O2 -ffunction-sections -fdata-sections -Wall -Wextra -Wno-unused-parameter -Wno-unused-variable
CXXFLAGS    := $(CFLAGS) -fno-rtti -fno-exceptions

# Tell the linker where to find libnx (and portlibs) explicitly
LIBDIRS     := $(DEVKITPRO)/libnx/lib $(DEVKITPRO)/portlibs/switch/lib
LIBS        := -lnx

# Default target so make always has one
.PHONY: all
all: $(TARGET).nro

# Pull in libnx rules (defines build/link steps)
include $(DEVKITPRO)/libnx/switch_rules
