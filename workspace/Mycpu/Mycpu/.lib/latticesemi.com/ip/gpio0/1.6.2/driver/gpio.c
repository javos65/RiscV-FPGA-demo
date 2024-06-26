/*   ==================================================================

     >>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
     ------------------------------------------------------------------
     Copyright (c) 2019-2023 by Lattice Semiconductor Corporation
     ALL RIGHTS RESERVED
     ------------------------------------------------------------------

       IMPORTANT: THIS FILE IS USED BY OR GENERATED BY the LATTICE PROPEL™
       DEVELOPMENT SUITE, WHICH INCLUDES PROPEL BUILDER AND PROPEL SDK.

       Lattice grants permission to use this code pursuant to the
       terms of the Lattice Propel License Agreement.

     DISCLAIMER:

    LATTICE MAKES NO WARRANTIES ON THIS FILE OR ITS CONTENTS,
    WHETHER EXPRESSED, IMPLIED, STATUTORY,
    OR IN ANY PROVISION OF THE LATTICE PROPEL LICENSE AGREEMENT OR
    COMMUNICATION WITH LICENSEE,
    AND LATTICE SPECIFICALLY DISCLAIMS ANY IMPLIED WARRANTY OF
    MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.
    LATTICE DOES NOT WARRANT THAT THE FUNCTIONS CONTAINED HEREIN WILL MEET
    LICENSEE 'S REQUIREMENTS, OR THAT LICENSEE' S OPERATION OF ANY DEVICE,
    SOFTWARE OR SYSTEM USING THIS FILE OR ITS CONTENTS WILL BE
    UNINTERRUPTED OR ERROR FREE,
    OR THAT DEFECTS HEREIN WILL BE CORRECTED.
    LICENSEE ASSUMES RESPONSIBILITY FOR SELECTION OF MATERIALS TO ACHIEVE
    ITS INTENDED RESULTS, AND FOR THE PROPER INSTALLATION, USE,
    AND RESULTS OBTAINED THEREFROM.
    LICENSEE ASSUMES THE ENTIRE RISK OF THE FILE AND ITS CONTENTS PROVING
    DEFECTIVE OR FAILING TO PERFORM PROPERLY AND IN SUCH EVENT,
    LICENSEE SHALL ASSUME THE ENTIRE COST AND RISK OF ANY REPAIR, SERVICE,
    CORRECTION,
    OR ANY OTHER LIABILITIES OR DAMAGES CAUSED BY OR ASSOCIATED WITH THE
    SOFTWARE.IN NO EVENT SHALL LATTICE BE LIABLE TO ANY PARTY FOR DIRECT,
    INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES,
    INCLUDING LOST PROFITS,
    ARISING OUT OF THE USE OF THIS FILE OR ITS CONTENTS,
    EVEN IF LATTICE HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
    LATTICE 'S SOLE LIABILITY, AND LICENSEE' S SOLE REMEDY,
    IS SET FORTH ABOVE.
    LATTICE DOES NOT WARRANT OR REPRESENT THAT THIS FILE,
    ITS CONTENTS OR USE THEREOF DOES NOT INFRINGE ON THIRD PARTIES'
    INTELLECTUAL PROPERTY RIGHTS, INCLUDING ANY PATENT. IT IS THE USER' S
    RESPONSIBILITY TO VERIFY THE USER SOFTWARE DESIGN FOR CONSISTENCY AND
    FUNCTIONALITY THROUGH THE USE OF FORMAL SOFTWARE VALIDATION METHODS.
     ------------------------------------------------------------------

     ================================================================== */

#include "gpio.h"
#include "gpio_regs.h"
#include "reg_access.h"
#include <stddef.h>

unsigned char gpio_init(struct gpio_instance *this_gpio,
		uint32_t base_addr,
		uint32_t lines_num, uint32_t gpio_dirs)
{
	unsigned int index = 0;
	if (NULL == this_gpio) {
		return 1;
	}
	this_gpio->base_address = base_addr;

	for (index = 0; index < lines_num; index++) {
		this_gpio->gpio_config[index].pin = 0x01 << index;

		if (gpio_dirs & (0x01 << index)) {
			reg_32b_modify(this_gpio->base_address | GPIO_DIRECTION,
					this_gpio->gpio_config[index].pin, (GPIO_OUTPUT << index));
#ifdef _DIRECTION_INTERNAL_MEMORY_USE_
			this_gpio->gpio_config[index].direction = GPIO_OUTPUT;
#endif
		} else {
			reg_32b_modify(this_gpio->base_address | GPIO_DIRECTION,
					this_gpio->gpio_config[index].pin, (GPIO_INPUT << index));
#ifdef _DIRECTION_INTERNAL_MEMORY_USE_
			this_gpio->gpio_config[index].direction = GPIO_INPUT;
#endif
		}
	}
	return 0;
}

unsigned char gpio_set_direction(struct gpio_instance *this_gpio,
		uint32_t index, enum gpio_direction gpio_dir)
{
	if (NULL == this_gpio) {
		return 1;
	}

	reg_32b_modify(this_gpio->base_address | GPIO_DIRECTION,
			this_gpio->gpio_config[index].pin, (gpio_dir << index));
#ifdef _DIRECTION_INTERNAL_MEMORY_USE_
	this_gpio->gpio_config[index].direction = gpio_dir;
#endif
	return 0;
}

unsigned char gpio_output_write(struct gpio_instance *this_gpio,
		uint32_t index, uint32_t value)
{
	if (NULL == this_gpio) {
		return 1;
	}

	reg_32b_modify(this_gpio->base_address | GPIO_WR_DATA,
			this_gpio->gpio_config[index].pin, value);

	return 0;
}

unsigned char gpio_input_get(struct gpio_instance *this_gpio,
		uint32_t index, uint32_t *data)
{
	if (NULL == this_gpio) {
		return 1;
	}
	reg_32b_read(this_gpio->base_address | GPIO_RD_DATA, data);
	return 0;
}
