# Minimal libnx Makefile — CI safe

TARGET      := SwitchSync
BUILD       := build
SOURCES     := source
INCLUDES    := include

APP_TITLE   := SwitchSync
APP_AUTHOR  := You
APP_VERSION := 0.1.0

CFLAGS      := -O2 -ffunction-sections -fdata-sections -Wall -Wextra -Wno-unused-parameter -Wno-unused-variable
CXXFLAGS    := $(CFLAGS) -fno-rtti -fno-exceptions
LIBS        := -lnx

.PHONY: all
all: $(TARGET).nro

include $(DEVKITPRO)/libnx/switch_rules
