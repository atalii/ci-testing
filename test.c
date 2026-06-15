#include <sys/personality.h>

int main(void)
{
	int old_personality = personality(0xffffffff);
	if (old_personality == -1) {
		printf("can't get personality\n");
		return 1;
	}

	if (personality(old_personality | ADDR_NO_RANDOMIZE) == -1) {
		printf("can't set personality\n");
		return 1;
	}
}
