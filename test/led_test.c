#define LED_ADDR 0x00001000

void delay(unsigned int count) {
    for (unsigned int i = 0; i < count; ++i) {
        asm volatile("nop");
    }
}

int main() {
    volatile unsigned int *led = (unsigned int *)LED_ADDR;

    while (1) {
        *led = 1;  // Turn on LED
        delay(5000);  // Delay
        *led = 0;  // Turn off LED
        delay(5000);  // Delay
    }

    return 0;
}
