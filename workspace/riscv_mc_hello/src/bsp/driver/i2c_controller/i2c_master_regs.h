/*   ==================================================================
     >>>>>>>>>>>>>>>>>>>>>>> COPYRIGHT NOTICE <<<<<<<<<<<<<<<<<<<<<<<<<
     ------------------------------------------------------------------
     Copyright (c) 2006-2024 by Lattice Semiconductor Corporation
     ALL RIGHTS RESERVED
     ------------------------------------------------------------------
  
	IMPORTANT: THIS FILE IS AUTO-GENERATED BY LATTICE RADIANT Software.
  
     Permission:
  
	Lattice grants permission to use this code pursuant to the
	terms of the Lattice Corporation Open Source License Agreement.
  
     Disclaimer:
  
	Lattice provides no warranty regarding the use or functionality
	of this code. It is the user's responsibility to verify the
	user Software design for consistency and functionality through
	the use of formal Software validation methods.
  
     ------------------------------------------------------------------
  
     Lattice Semiconductor Corporation
     111 SW Fifth Avenue, Suite 700
     Portland, OR 97204
     U.S.A
  
     Email: techsupport@latticesemi.com
     Web: http://www.latticesemi.com/Home/Support/SubmitSupportTicket.aspx
     ================================================================== */

#ifndef I2C_MASTER_REGS_H
#define I2C_MASTER_REGS_H



/*
*  i2c master register definition
*/

#define REG_DATA_BUFFER                      (0x00)

#define REG_SLAVE_ADDR_LOW                   (0x01*4)
#define REG_SLAVE_ADDR_HIGH                  (0x02*4)

#define REG_CONFIG                           (0x03*4)
#define I2C_MASTER_RX_FIFO_RESET	   (0x40)
#define I2C_MASTER_TX_FIFO_RESET	   (0x20)
#define I2C_MASTER_REPEATED_START      (0x08)
#define I2C_MASTER_RESET               (0x04)
#define I2C_ABORT                      (0x02)
#define I2C_START                      (0x01)

#define REG_BYTE_CNT                         (0x04*4)

#define REG_MODE                             (0x05*4)
#define I2C_SPEED_MODE					(0xC0)
#define I2C_ADDR_MODE                   (0x20)
#define I2C_ACK_MODE                    (0x10)
#define I2C_TXRX_MODE                   (0x08)
#define I2C_CLK_DIV_HIGH                (0x03)


#define REG_CLK_DIV_LSB                       (0x06*4)

#define REG_INT_STATUS1                      (0x07*4)
#define REG_INT_ENABLE1                      (0x08*4)
#define REG_INT_SET1                         (0x09*4)
#define I2C_TRANSFER_COMP_MASK					(0x80)
#define TX_FIFO_FULL_MASK						(0x20)
#define TX_FIFO_AEMPTY_MASK						(0x10)
#define TX_FIFO_EMPTY_MASK                     	(0x08)
#define RX_FIFO_FULL_MASK               		(0x04)
#define RX_FIFO_AFULL_MASK              		(0x02)
#define RX_FIFO_RDY_MASK            			(0x01)


#define REG_INT_STATUS2                      (0x0A*4)
#define REG_INT_ENABLE2                      (0x0B*4)
#define REG_INT_SET2                         (0x0C*4)
#define NACK_ERR_MASK                     		(0x08)
#define ABORT_ACK_MASK               			(0x04)
#define ARB_LOST_MASK              				(0x02)
#define TIMEOUT_MASK            				(0x01)

#define FIFO_STATUS_REG						(0x0D*4)
#define RX_FIFO_EMPTY_MASK						(0x01)

#define SCL_TIMEOUT_REG						(0x0E*4)

#define I2C_ERR                                 (0x0F)

#endif				/*I2C Master Registers Header File */