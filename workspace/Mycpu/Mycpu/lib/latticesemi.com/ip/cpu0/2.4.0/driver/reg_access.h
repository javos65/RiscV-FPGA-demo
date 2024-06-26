/*   ==================================================================

     >>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
     ------------------------------------------------------------------
     Copyright (c) 2019-2020 by Lattice Semiconductor Corporation
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
#ifndef REG_ACCESS_H
#define REG_ACCESS_H

//#include "sys_platform.h"
//#include <stdint.h>

//typedef unsigned int XLEN;  // 32bit for RV32, 64bit for RV64

/*
 * reg_32b_write is used to write the content of a 32 bits wide peripheral
 * register.
 *
 * @param reg_addr  Address in the processor's memory map of the register to
 *                  write.
 * @param value     Value to be written into the peripheral register.
 */
unsigned char reg_32b_write(unsigned int reg_addr, unsigned int value);

/*
 * reg_32b_read is used to read the content of a 32 bits wide peripheral
 * register.
 *
 * @param reg_addr  Address in the processor's memory map of the register to
 *                  read.
 * @return          32 bits value read from the peripheral register.
 */
unsigned char reg_32b_read(unsigned int reg_addr,
			   unsigned int *reg_32b_value);
unsigned char reg_32b_modify(unsigned int reg_addr, unsigned int bits_mask,
			     unsigned int value);

unsigned char reg_16b_write(unsigned int reg_addr, unsigned short value);

unsigned char reg_16b_read(unsigned int reg_addr,
			   unsigned short *reg_16b_value);

unsigned char reg_8b_write(unsigned int reg_addr, unsigned char value);

/*
 * reg_8b_modify is used to modify the masked bits of a 8 bits wide peripheral
 * register.
 *
 * @param reg_addr  Address in the processor's memory map of the register to
 *                  read.
 * @bits_mask       Bits that will be modified within the register
 * @value           The value will be modified to the masked bits of the register
 * @return
 */
unsigned char reg_8b_modify(unsigned int reg_addr, unsigned char bits_mask,
			    unsigned char value);

/*
 * reg_8b_read is used to read the content of a 8 bits wide peripheral
 * register.
 *
 * @param reg_addr  Address in the processor's memory map of the register to
 *                  read.
 * @return          8 bits value read from the peripheral register.
 */
unsigned char reg_8b_read(unsigned int reg_addr,
			  unsigned char *reg_8b_value);

#endif				/*REG_ACCESS_H */
