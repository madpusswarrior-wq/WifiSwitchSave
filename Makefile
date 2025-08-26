# Minimal libnx Makefile — CI safe

TARGET      := SwitchSync
OUTPUT      := $(TARGET)

BUILD       := build
SOURCES     := source
INCLUDES    := include

APP_TITLE   := SwitchSync
APP_AUTHOR  := You
APP_VERSION := 0.1.0

CFLAGS      := -O2 -ffunction-sections -fdata-sections -Wall -Wextra -Wno-unused-parameter -Wno-unused-variable
CXXFLAGS    := $(CFLAGS) -fno-rtti -fno-exceptions
LDFLAGS     := -Wl,--gc-sections
LIBS        := -lnx

# Give make a default target (so it never says "No targets")
.PHONY: all
all: $(OUTPUT).nro

# Pull in libnx build rules (defines how to build $(OUTPUT).nro)
include $(DEVKITPRO)/libnx/switch_rules
