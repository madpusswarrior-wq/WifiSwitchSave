TARGET      := SwitchSync
BUILD       := build
SOURCES     := source
INCLUDES    :=

APP_TITLE   := SwitchSync
APP_AUTHOR  := You
APP_VERSION := 0.1.0

CFLAGS      := -O2 -ffunction-sections -fdata-sections -Wall -Wextra -Wno-unused-parameter -Wno-unused-variable
CXXFLAGS    := $(CFLAGS) -fno-rtti -fno-exceptions
CPPFLAGS    := -I$(DEVKITPRO)/libnx/include -I$(DEVKITPRO)/portlibs/switch/include
LDFLAGS     := -L$(DEVKITPRO)/libnx/lib -L$(DEVKITPRO)/portlibs/switch/lib -specs=$(DEVKITPRO)/libnx/switch.specs
LIBS        := -lnx

.PHONY: all
all: $(TARGET).nro

include $(DEVKITPRO)/libnx/switch_rules
