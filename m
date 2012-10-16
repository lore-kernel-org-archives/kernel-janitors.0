From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 16 Oct 2012 17:22:43 +0000
Subject: [vexpress:for-tixy 1/13] include/linux/mfd/tps65912.h:301:19: error: field 'gpio' has incomplete typ
Message-Id: <20121016172243.GB11813@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pawel Moll <pawel.moll@arm.com>
Cc: kernel-janitors@vger.kernel.org, Parisc List <linux-parisc@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@linaro.org>


Hi Pawel,

FYI, kernel build failed on

tree:   git://git.linaro.org/people/pawelmoll/linux.git for-tixy
head:   5e1365f66d14192704de05e796498ecb3fc4ba1f
commit: 7037839fdc0ead74bfc3c43e3e5d8617a24c9bc4 [1/13] video: Versatile Express DVI output driver
config: parisc-allyesconfig # make ARCH=parisc 

All error/warnings:

In file included from drivers/mfd/tps65912-core.c:22:0:
include/linux/mfd/tps65912.h:301:19: error: field 'gpio' has incomplete type
--
drivers/mfd/sm501.c:42:19: error: field 'gpio' has incomplete type
drivers/mfd/sm501.c: In function 'to_sm501_gpio':
drivers/mfd/sm501.c:884:9: warning: initialization from incompatible pointer type [enabled by default]
drivers/mfd/sm501.c: At top level:
drivers/mfd/sm501.c:1009:15: error: variable 'gpio_chip_template' has initializer but incomplete type
drivers/mfd/sm501.c:1010:2: error: unknown field 'ngpio' specified in initializer
drivers/mfd/sm501.c:1010:2: warning: excess elements in struct initializer [enabled by default]
drivers/mfd/sm501.c:1010:2: warning: (near initialization for 'gpio_chip_template') [enabled by default]
drivers/mfd/sm501.c:1011:2: error: unknown field 'direction_input' specified in initializer
drivers/mfd/sm501.c:1011:2: warning: excess elements in struct initializer [enabled by default]
drivers/mfd/sm501.c:1011:2: warning: (near initialization for 'gpio_chip_template') [enabled by default]
drivers/mfd/sm501.c:1012:2: error: unknown field 'direction_output' specified in initializer
drivers/mfd/sm501.c:1012:2: warning: excess elements in struct initializer [enabled by default]
drivers/mfd/sm501.c:1012:2: warning: (near initialization for 'gpio_chip_template') [enabled by default]
drivers/mfd/sm501.c:1013:2: error: unknown field 'set' specified in initializer
drivers/mfd/sm501.c:1013:2: warning: excess elements in struct initializer [enabled by default]
drivers/mfd/sm501.c:1013:2: warning: (near initialization for 'gpio_chip_template') [enabled by default]
drivers/mfd/sm501.c:1014:2: error: unknown field 'get' specified in initializer
drivers/mfd/sm501.c:1014:2: warning: excess elements in struct initializer [enabled by default]
drivers/mfd/sm501.c:1014:2: warning: (near initialization for 'gpio_chip_template') [enabled by default]
drivers/mfd/sm501.c: In function 'sm501_gpio_register_chip':
drivers/mfd/sm501.c:1032:8: error: dereferencing pointer to incomplete type
drivers/mfd/sm501.c:1036:8: error: dereferencing pointer to incomplete type
drivers/mfd/sm501.c:1039:7: error: dereferencing pointer to incomplete type
drivers/mfd/sm501.c:1042:2: error: implicit declaration of function 'gpiochip_add' [-Werror=implicit-function-declaration]
drivers/mfd/sm501.c: In function 'sm501_register_gpio':
drivers/mfd/sm501.c:1089:2: error: implicit declaration of function 'gpiochip_remove' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
drivers/mfd/htc-i2cpld.c:51:26: error: field 'chip_out' has incomplete type
drivers/mfd/htc-i2cpld.c:55:26: error: field 'chip_in' has incomplete type
drivers/mfd/htc-i2cpld.c: In function 'htcpld_chip_set':
drivers/mfd/htc-i2cpld.c:233:14: warning: initialization from incompatible pointer type [enabled by default]
drivers/mfd/htc-i2cpld.c: In function 'htcpld_chip_get':
drivers/mfd/htc-i2cpld.c:268:14: warning: initialization from incompatible pointer type [enabled by default]
drivers/mfd/htc-i2cpld.c:272:15: warning: initialization from incompatible pointer type [enabled by default]
drivers/mfd/htc-i2cpld.c: In function 'htcpld_direction_input':
drivers/mfd/htc-i2cpld.c:305:23: error: dereferencing pointer to incomplete type
drivers/mfd/htc-i2cpld.c: In function 'htcpld_chip_to_irq':
drivers/mfd/htc-i2cpld.c:312:14: warning: initialization from incompatible pointer type [enabled by default]
drivers/mfd/htc-i2cpld.c: In function 'htcpld_register_chip_gpio':
drivers/mfd/htc-i2cpld.c:457:11: error: dereferencing pointer to incomplete type
drivers/mfd/htc-i2cpld.c:458:11: error: dereferencing pointer to incomplete type
drivers/mfd/htc-i2cpld.c:459:11: error: dereferencing pointer to incomplete type
drivers/mfd/htc-i2cpld.c:460:11: error: dereferencing pointer to incomplete type
drivers/mfd/htc-i2cpld.c:461:11: error: dereferencing pointer to incomplete type
drivers/mfd/htc-i2cpld.c:462:11: error: dereferencing pointer to incomplete type
drivers/mfd/htc-i2cpld.c:463:11: error: dereferencing pointer to incomplete type
drivers/mfd/htc-i2cpld.c:464:11: error: dereferencing pointer to incomplete type
drivers/mfd/htc-i2cpld.c:465:11: error: dereferencing pointer to incomplete type
drivers/mfd/htc-i2cpld.c:468:11: error: dereferencing pointer to incomplete type
drivers/mfd/htc-i2cpld.c:469:11: error: dereferencing pointer to incomplete type
drivers/mfd/htc-i2cpld.c:470:11: error: dereferencing pointer to incomplete type
drivers/mfd/htc-i2cpld.c:471:11: error: dereferencing pointer to incomplete type
drivers/mfd/htc-i2cpld.c:472:11: error: dereferencing pointer to incomplete type
drivers/mfd/htc-i2cpld.c:473:11: error: dereferencing pointer to incomplete type
drivers/mfd/htc-i2cpld.c:474:11: error: dereferencing pointer to incomplete type
drivers/mfd/htc-i2cpld.c:475:11: error: dereferencing pointer to incomplete type
drivers/mfd/htc-i2cpld.c:476:11: error: dereferencing pointer to incomplete type
drivers/mfd/htc-i2cpld.c:477:11: error: dereferencing pointer to incomplete type
drivers/mfd/htc-i2cpld.c:480:2: error: implicit declaration of function 'gpiochip_add' [-Werror=implicit-function-declaration]
drivers/mfd/htc-i2cpld.c:494:3: error: implicit declaration of function 'gpiochip_remove' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
drivers/mfd/tps65010.c:91:19: error: field 'chip' has incomplete type
drivers/mfd/tps65010.c: In function 'tps65010_output':
drivers/mfd/tps65010.c:479:9: warning: initialization from incompatible pointer type [enabled by default]
drivers/mfd/tps65010.c: In function 'tps65010_gpio_get':
drivers/mfd/tps65010.c:496:8: warning: initialization from incompatible pointer type [enabled by default]
drivers/mfd/tps65010.c: In function 'tps65010_probe':
drivers/mfd/tps65010.c:654:3: error: implicit declaration of function 'gpiochip_add' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
In file included from drivers/mfd/ucb1400_core.c:26:0:
include/linux/ucb1400.h:93:19: error: field 'gc' has incomplete type
--
In file included from drivers/mfd/timberdale.c:39:0:
include/linux/spi/max7301.h:15:19: error: field 'chip' has incomplete type

vim +301 include/linux/mfd/tps65912.h

36e52873 Margarita Olaya 2011-06-09  285  
36e52873 Margarita Olaya 2011-06-09  286  struct tps65912 {
36e52873 Margarita Olaya 2011-06-09  287  	struct device *dev;
36e52873 Margarita Olaya 2011-06-09  288  	/* for read/write acces */
36e52873 Margarita Olaya 2011-06-09  289  	struct mutex io_mutex;
36e52873 Margarita Olaya 2011-06-09  290  
36e52873 Margarita Olaya 2011-06-09  291  	/* For device IO interfaces: I2C or SPI */
36e52873 Margarita Olaya 2011-06-09  292  	void *control_data;
36e52873 Margarita Olaya 2011-06-09  293  
36e52873 Margarita Olaya 2011-06-09  294  	int (*read)(struct tps65912 *tps65912, u8 reg, int size, void *dest);
36e52873 Margarita Olaya 2011-06-09  295  	int (*write)(struct tps65912 *tps65912, u8 reg, int size, void *src);
36e52873 Margarita Olaya 2011-06-09  296  
36e52873 Margarita Olaya 2011-06-09  297  	/* Client devices */
36e52873 Margarita Olaya 2011-06-09  298  	struct tps65912_pmic *pmic;
36e52873 Margarita Olaya 2011-06-09  299  
36e52873 Margarita Olaya 2011-06-09  300  	/* GPIO Handling */
36e52873 Margarita Olaya 2011-06-09 @301  	struct gpio_chip gpio;
36e52873 Margarita Olaya 2011-06-09  302  
36e52873 Margarita Olaya 2011-06-09  303  	/* IRQ Handling */
36e52873 Margarita Olaya 2011-06-09  304  	struct mutex irq_lock;
36e52873 Margarita Olaya 2011-06-09  305  	int chip_irq;
36e52873 Margarita Olaya 2011-06-09  306  	int irq_base;
36e52873 Margarita Olaya 2011-06-09  307  	int irq_num;
36e52873 Margarita Olaya 2011-06-09  308  	u32 irq_mask;
36e52873 Margarita Olaya 2011-06-09  309  };

The code at line 301 was first introduced by commit:
36e5287 mfd: tps65912: Add new mfd device


---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
