// >>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
// ------------------------------------------------------------------
// Copyright (c) 2019-2023 by Lattice Semiconductor Corporation
// ALL RIGHTS RESERVED
// ------------------------------------------------------------------
//
// IMPORTANT: THIS FILE IS USED BY OR GENERATED BY the LATTICE PROPEL™
// DEVELOPMENT SUITE, WHICH INCLUDES PROPEL BUILDER AND PROPEL SDK.
//
// Lattice grants permission to use this code pursuant to the
// terms of the Lattice Propel License Agreement.
//
// DISCLAIMER:
//
//  LATTICE MAKES NO WARRANTIES ON THIS FILE OR ITS CONTENTS, WHETHER
//  EXPRESSED, IMPLIED, STATUTORY, OR IN ANY PROVISION OF THE LATTICE
//  PROPEL LICENSE AGREEMENT OR COMMUNICATION WITH LICENSEE, AND LATTICE 
//  SPECIFICALLY DISCLAIMS ANY IMPLIED WARRANTY OF MERCHANTABILITY OR
//  FITNESS FOR A PARTICULAR PURPOSE.  LATTICE DOES NOT WARRANT THAT THE
//  FUNCTIONS CONTAINED HEREIN WILL MEET LICENSEE'S REQUIREMENTS, OR THAT
//  LICENSEE'S OPERATION OF ANY DEVICE, SOFTWARE OR SYSTEM USING THIS FILE
//  OR ITS CONTENTS WILL BE UNINTERRUPTED OR ERROR FREE, OR THAT DEFECTS
//  HEREIN WILL BE CORRECTED.  LICENSEE ASSUMES RESPONSIBILITY FOR 
//  SELECTION OF MATERIALS TO ACHIEVE ITS INTENDED RESULTS, AND FOR THE
//  PROPER INSTALLATION, USE, AND RESULTS OBTAINED THEREFROM.  LICENSEE
//  ASSUMES THE ENTIRE RISK OF THE FILE AND ITS CONTENTS PROVING DEFECTIVE
//  OR FAILING TO PERFORM PROPERLY AND IN SUCH EVENT, LICENSEE SHALL 
//  ASSUME THE ENTIRE COST AND RISK OF ANY REPAIR, SERVICE, CORRECTION, OR
//  ANY OTHER LIABILITIES OR DAMAGES CAUSED BY OR ASSOCIATED WITH THE 
//  SOFTWARE.  IN NO EVENT SHALL LATTICE BE LIABLE TO ANY PARTY FOR DIRECT,
//  INDIRECT,SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING LOST
//  PROFITS, ARISING OUT OF THE USE OF THIS FILE OR ITS CONTENTS, EVEN IF
//  LATTICE HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. LATTICE'S
//  SOLE LIABILITY, AND LICENSEE'S SOLE REMEDY, IS SET FORTH ABOVE.  
//  LATTICE DOES NOT WARRANT OR REPRESENT THAT THIS FILE, ITS CONTENTS OR
//  USE THEREOF DOES NOT INFRINGE ON THIRD PARTIES' INTELLECTUAL PROPERTY
//  RIGHTS, INCLUDING ANY PATENT. IT IS THE USER'S RESPONSIBILITY TO VERIFY
//  THE USER SOFTWARE DESIGN FOR CONSISTENCY AND FUNCTIONALITY THROUGH THE
//  USE OF FORMAL SOFTWARE VALIDATION METHODS.
// ------------------------------------------------------------------

#ifndef UTILS_H_
#define UTILS_H_

#include <stdint.h>
#include "sys_platform.h"

#ifndef true
#define true 1
#endif

#ifndef false
#define false 0
#endif

typedef struct timer_reg_s {
	volatile uint32_t cnt_l;
	volatile uint32_t cnt_h;
	volatile uint32_t rsvd[2];
	volatile uint32_t cmp_l;
	volatile uint32_t cmp_h;
} timer_reg_t, *timer_reg_p;

#define CONFIG_DEFAULT_M_HZ (100)
//#define CPU_M_FREQUENCY   (108)  /* Use this line if got the true cpu frequency */

#ifdef CPU_M_FREQUENCY
#define SYSCLK_KHZ (CPU_M_FREQUENCY * 1000)
#define TIMER0_INST_BASE_ADDR (CPU0_INST_BASE_ADDR + 0x400)
void delayMS(uint32_t ms);
#else
#define SYSCLK_KHZ (CONFIG_DEFAULT_M_HZ * 1000)
#define CYCLE_HZ ((SYSCLK_KHZ) / 12)
void delayCycle(volatile uint32_t count);
#endif


#define LED_SET(v) *((volatile uint32_t *)(GPIO_INST_BASE_ADDR + 0x04)) = (v)
//#define LED_ON(s)  *((volatile uint32_t *)(GPIO_INST_BASE_ADDR + 0x0C)) = 1 << s
//#define LED_OFF(s) *((volatile uint32_t *)(GPIO_INST_BASE_ADDR + 0x08)) = 1 << s

#define LED_COUNT 8
#define ALL_OFF   0xFF
#define LED_ON(n) (ALL_OFF - (1 << n))

void delay(uint32_t count);

#define RTL_SIM 0

#endif /* UTILS_H_ */
