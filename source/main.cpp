#include <switch.h>
#include <stdio.h>

static void press_plus() {
    PadState pad; padInitializeDefault(&pad);
    printf("\nPress + to go back.\n");
    while (appletMainLoop()) {
        padUpdate(&pad);
        if (padGetButtonsDown(&pad) & HidNpadButton_Plus) break;
        consoleUpdate(NULL);
    }
}

static void action_export_csv() {
    consoleClear();
    printf("Export CSV (stub)\n");
    printf("This is the skeleton build. Replace with real CSV export once CI is green.\n");
    press_plus();
}

static void action_auto_pair_sync() {
    consoleClear();
    printf("Auto-pair & Sync (stub)\n");
    printf("This is the skeleton build. Replace with Wi-Fi code once CI is green.\n");
    press_plus();
}

static void draw_menu(int cursor, const char** items, int n) {
    consoleClear();
    printf("SwitchSync — Skeleton v0.1\n\n");
    for (int i=0;i<n;i++) {
        printf("%s %s\n", (i==cursor?">":" "), items[i]);
    }
    printf("\nA=select  B=back  +=exit\n");
}

int main(int argc, char** argv) {
    consoleInit(NULL);

    padConfigureInput(1, HidNpadStyleSet_NpadStandard);
    PadState pad; padInitializeDefault(&pad);

    int cursor = 0;
    const char* items[] = {
        "Export Local Titles (CSV) — STUB",
        "Auto-Pair & Sync — STUB",
        "Exit"
    };
    const int nItems = sizeof(items)/sizeof(items[0]);

    while (appletMainLoop()) {
        draw_menu(cursor, items, nItems);
        padUpdate(&pad);
        u64 kDown = padGetButtonsDown(&pad);
        if (kDown & HidNpadButton_Down) cursor = (cursor+1)%nItems;
        if (kDown & HidNpadButton_Up)   cursor = (cursor-1+nItems)%nItems;
        if (kDown & HidNpadButton_A) {
            if (cursor==0) action_export_csv();
            else if (cursor==1) action_auto_pair_sync();
            else break;
        }
        if (kDown & HidNpadButton_Plus || kDown & HidNpadButton_B) break;
        consoleUpdate(NULL);
    }

    consoleExit(NULL);
    return 0;
}
