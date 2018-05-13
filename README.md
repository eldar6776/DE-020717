# DE-020717
	Hotel Room Thermostat With Capacitive Touch 4,3" TFT LCD And Audio Codec


/**
 ******************************************************************************
 * Project Name		: DE-020717
 * Date 		: 02.07.2017.
 * Hardware IDE		: Altium Designer 16.0.5
 * Firmware IDE		: KEIL uVision 5.25.0.0
 * Target Device	: STM32F746ZET  (LQFP-144, 512 Kbytes Flash, 216 MHz)
 ******************************************************************************
 * 
 * Feature 		: Hardware 	
 * ----------------------------------------------------------------------------
 *	
 *	1 OneWire Serial Port For Connection On Room Control Bus Or Digital Sensors
 *	1 RS485 Serial Port For Connection On Hotel Control Bus
 *	6 Digital Otputs 0,5A 50V For Fancoil Control
 *	2 High Speed Digital Inputs Sensing Mains Phase Zero Crossing And Fan RPM
 *	3 Analog Inputs For Temperature And Light Sensing
 *	Audio Codec With Wave Player And 1W Speacker Amplifier Is Used For Audio Signal
 *	2,4GHz Radio Transciever 1Mbps For Wireless Connection To Control Network
 *	Battery Connector For RTC Backup 
 *	5Vdc Or 12Vdc Power Supply
 *
 * ----------------------------------------------------------------------------
 *	
 *			: Firmware
 * ----------------------------------------------------------------------------
 *	
 *	Room Temperature Set, Ambient Temperature Monitoring, Fancoil Fan Speed
 *	In 3 Manual Presets (Lo, Mid, Hi). Automatic Fancoil Fan Speed With PID 
 *	Control Loop When Fancoil Fan Motor Is Equipped With RPM Sensor And  
 *	Triac Is Used For Phase Control Of Fan Motor AC Power Supply. When 3 Speed
 *	Fancoil Fan Motor Is Used, Proportional Controller Is Activ In Automatic Mode.
 *	Set Thermostat For Cooling Or Heating. Software One Cycle Function Activation
 * 	Used For Room Preheating Or Precooling To Comfortable Temperature.
 *	7 Days Wheter Forecast Info Screen. Alarm Clock With One Preset.
 *	Button For "Do Not Disturb" Function Activation / Deactivation. Message Is 
 *	Displayed On Outdoor Room Controller Display And Doorbell Is Disabled.
 *	Button For "Call Handmaid" Activation / Deactivation. Signal Is Activated
 *	On Outdoor Room Controller Display And Call Is Send To Reception PC Software
 *	Button For "SOS Reset" When SOS Alarm Is Activated By Pulling SOS Switch In
 *	Bathroom.
 *
 * ----------------------------------------------------------------------------
 *
 ******************************************************************************
 */
