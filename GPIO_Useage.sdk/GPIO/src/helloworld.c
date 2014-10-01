#include "xparameters.h" /* Peripheral parameters  */
#include "xgpio.h"       /* GPIO data struct and APIs */
#include "xil_printf.h"
#include "xil_cache.h"

#define GPIO_BITWIDTH	8	/* This is the width of the GPIO */
#define GPIO_DEVICE_ID  XPAR_AXI_GPIO_0_DEVICE_ID //device id
#define LED_DELAY     10000000 /* times delay*/
#define LED_MAX_BLINK	0x1	/* Number of times the LED Blinks */
#define LED_CHANNEL 1        /* GPIO channel*/
#define printf xil_printf	/* A smaller footprint printf */
XGpio Gpio; /* The Instance of the GPIO Driver */
XGpio GpioOutput; /* The driver instance for GPIO Device configured as O/P */

int GpioMarquee (u16 DeviceId, u32 GpioWidth)
{
	volatile int Delay;
	u32 LedBit;
	u32 LedLoop;
	int Status;
	/*
	 * Initialize the GPIO driver so that it's ready to use,
	 * specify the device ID that is generated in xparameters.h
	 */
	 Status = XGpio_Initialize(&GpioOutput, DeviceId);
	 if (Status != XST_SUCCESS)  {
		  return XST_FAILURE;
	 }
	 //Set the direction for all signals to be outputs
	 XGpio_SetDataDirection(&GpioOutput, LED_CHANNEL, 0x0);
	 // Set the GPIO outputs to low
	 XGpio_DiscreteWrite(&GpioOutput, LED_CHANNEL, 0x0);
	 for (LedBit = 0x0; LedBit < GpioWidth; LedBit++)  {
		for (LedLoop = 0; LedLoop < LED_MAX_BLINK; LedLoop++) {
			//Set the GPIO Output to High
			XGpio_DiscreteWrite(&GpioOutput, LED_CHANNEL,
						1 << LedBit);
			//Wait a small amount of time so the LED is visible
			for (Delay = 0; Delay < LED_DELAY; Delay++);
			//Clear the GPIO Output
			XGpio_DiscreteClear(&GpioOutput, LED_CHANNEL,
						1 << LedBit);
			// Wait a small amount of time so the LED is visible
			for (Delay = 0; Delay < LED_DELAY; Delay++);
		  }
	 }
	 return XST_SUCCESS;
}
int main(void)
{//Application start
	/* loop forever*/
	while(1){
		u32 status;
		status = GpioMarquee (GPIO_DEVICE_ID,GPIO_BITWIDTH);
		if (status == 0)
			print("SUCESS!.\r\n");
		else print("FAILED.\r\n");
	}
	return XST_SUCCESS;
}
