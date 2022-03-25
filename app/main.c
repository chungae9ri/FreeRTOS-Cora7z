/* Standard includes. */
#include <stdio.h>
#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"
#include "xil_printf.h"

#define STACK_SIZE 1024
#define TASK_PRIORITY (configMAX_PRIORITIES - 1)
#define XUART_PS_MR_OfFSET		(4U)
typedef struct uart_ps {
	volatile uint32_t CR;
	volatile uint32_t MR;
	volatile uint32_t IER;
	volatile uint32_t IDR;
	volatile const uint32_t IMR;
	volatile uint32_t ISR;
	volatile uint32_t BAUDGEN;
	volatile uint32_t RXTOUT;
	volatile uint32_t RXWM;
	volatile uint32_t MODEMCR;
	volatile uint32_t MODEMSR;
	volatile const uint32_t SR;
	volatile uint32_t FIFO;
	volatile uint32_t BAUD_DIV;
	volatile uint32_t FLOW_DELAY;
	volatile uint32_t TX_FIFO_TRIG_LV;
} UART_PS_t;

void init_uart(void)
{
	UART_PS_t *puart = (UART_PS_t *)(STDIN_BASEADDRESS);
	puart->CR = 0x00000114;
	puart->MR = 0x00000020;
	puart->IER = 0x00000000;
	puart->IDR = 0x00000000;
	puart->BAUDGEN = 0x0000007C;
	puart->RXTOUT = 0x0000000A;
	puart->RXWM = 0x00000038;
	puart->MODEMCR = 0x00000003;
	puart->BAUD_DIV = 0x00000006;
	puart->FLOW_DELAY = 0x00000000;
	puart->TX_FIFO_TRIG_LV = 0x00000020;
}

void vPlatformInit(void)
{
	init_uart();
	xil_printf("vPlatformInit\n");
}


void vTaskOutStream(void *pvParams)
{
	const TickType_t xDelay = pdMS_TO_TICKS(200);

	for (;;) {
		xil_printf("%s\n", __func__);
		vTaskDelay(xDelay);
	}
}

int main(void)
{
	TaskHandle_t xHandle;

	vPlatformInit();

	if (xTaskCreate(vTaskOutStream,
			"OutStreamTask",
			STACK_SIZE,
			NULL,
			TASK_PRIORITY,
			&xHandle
		   ) != pdPASS) {
		xil_printf("Start OutStreamTask fail\n");
	}

	xil_printf("vTaskStartScheduler success\n");
	vTaskStartScheduler();
	
	while(1);

	return 0;
}

void vAssertCalled( const char * pcFile, unsigned long ulLine )
{
	volatile unsigned long ul = 0;

	( void ) pcFile;
	( void ) ulLine;

	taskENTER_CRITICAL();
	/* Set ul to a non-zero value using the debugger to step out of this
	   function. */
	while( ul == 0 ) {
		portNOP();
	}
	taskEXIT_CRITICAL();
}
