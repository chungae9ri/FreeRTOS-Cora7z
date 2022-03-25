#include "FreeRTOS.h"
#include "task.h"

void XTime_SetTime(void);
void _exit(int status) __attribute__((weak));
void _init(void);
void _fini(void);
void _sbrk(void);

#if (configCHECK_FOR_STACK_OVERFLOW > 0)
void vApplicationStackOverflowHook(TaskHandle_t xTask, 
		char *pcTaskName);
#endif

#if (configCHECK_FOR_STACK_OVERFLOW > 0)
void vApplicationStackOverflowHook(TaskHandle_t xTask, 
		char *pcTaskName)
{

}
#endif

void XTime_SetTime(void)
{

}

void _exit(int status)
{
	while(1);
}

void _init(void)
{

}

void _fini(void)
{

}


void _sbrk(void)
{

}
