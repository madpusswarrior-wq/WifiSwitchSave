# Minimal libnx Makefile — hardwired paths so -lnx always resolves

TARGET      := SwitchSync
BUILD       := build
SOURCES     := source
INCLUDES    :=

APP_TITLE   := SwitchSync
APP_AUTHOR  := You
APP_VERSION := 0.1.0

# Compile flags
CFLAGS      := -O2 -ffunction-sections -fdata-sections -Wall -Wextra -Wno-unused-parameter -Wno-unused-variable
CXXFLAGS    := $(CFLAGS) -fno-rtti -fno-exceptions

# Point directly at libnx headers & libs + specs
CPPFLAGS    := -I$(DEVKITPRO)/libnx/include -I$(DEVKITPRO)/portlibs/switch/include
LDFLAGS     := -L$(DEVKITPRO)/libnx/lib -L$(DEVKITPRO)/portlibs/switch/lib -specs=$(DEVKITPRO)/libnx/switch.specs
LIBS        := -lnx

# Default target so make always has one
.PHONY: all
all: $(TARGET).nro

# libnx build rules (uses the vars above)
include $(DEVKITPRO)/libnx/switch_rules
