#include <switch.h>

int main(int argc, char* argv[]) {
    consoleInit(NULL);

    // Simple input using the Pad API (libnx 4.x)
    padConfigureInput(1, HidNpadStyleSet_NpadStandard);
    PadState pad;
    padInitializeDefault(&pad);

    printf("SwitchSync — skeleton\n");
    printf("Press + to exit\n");

    while (appletMainLoop()) {
        padUpdate(&pad);
        u64 kDown = padGetButtonsDown(&pad);
        if (kDown & HidNpadButton_Plus) break;
        consoleUpdate(NULL);
    }

    consoleExit(NULL);
    return 0;
}
