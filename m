From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 16 Oct 2012 05:58:29 +0000
Subject: [jdelvare-staging:i2c-for-linus 9/15] drivers/leds/leds-tca6507.c:179:20: error: field 'gpio' has in
Message-Id: <20121016055829.GA31864@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121008071452.GA29214@localhost>
In-Reply-To: <20121008071452.GA29214@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean Delvare <khali@linux-fr.org>
Cc: kernel-janitors@vger.kernel.org, Parisc List <linux-parisc@vger.kernel.org>

Hi Jean,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jdelvare/staging.git i2c-for-linus
head:   c415b303a704e5c5f766fc0404093910c36cc4ab
commit: 3ad7ea18ae8c7ddda46b7276e0bda73e707ea9c1 [9/15] i2c-i801: Support SMBus multiplexing on Asus Z8 series
config: parisc-allyesconfig # make ARCH=parisc allyesconfig

All error/warnings:

drivers/leds/leds-tca6507.c:179:20: error: field 'gpio' has incomplete type
drivers/leds/leds-tca6507.c: In function 'tca6507_gpio_set_value':
drivers/leds/leds-tca6507.c:591:29: warning: initialization from incompatible pointer type [enabled by default]
drivers/leds/leds-tca6507.c:591:29: warning: (near initialization for 'tca') [enabled by default]
drivers/leds/leds-tca6507.c: In function 'tca6507_probe_gpios':
drivers/leds/leds-tca6507.c:640:2: error: implicit declaration of function 'gpiochip_add' [-Werror=implicit-function-declaration]
drivers/leds/leds-tca6507.c: In function 'tca6507_remove_gpio':
drivers/leds/leds-tca6507.c:653:3: error: implicit declaration of function 'gpiochip_remove' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
drivers/input/touchscreen/ad7879.c:115:19: error: field 'gc' has incomplete type
drivers/input/touchscreen/ad7879.c: In function 'ad7879_gpio_direction_input':
drivers/input/touchscreen/ad7879.c:385:22: warning: initialization from incompatible pointer type [enabled by default]
drivers/input/touchscreen/ad7879.c:385:22: warning: (near initialization for 'ts') [enabled by default]
drivers/input/touchscreen/ad7879.c: In function 'ad7879_gpio_direction_output':
drivers/input/touchscreen/ad7879.c:399:22: warning: initialization from incompatible pointer type [enabled by default]
drivers/input/touchscreen/ad7879.c:399:22: warning: (near initialization for 'ts') [enabled by default]
drivers/input/touchscreen/ad7879.c: In function 'ad7879_gpio_get_value':
drivers/input/touchscreen/ad7879.c:418:22: warning: initialization from incompatible pointer type [enabled by default]
drivers/input/touchscreen/ad7879.c:418:22: warning: (near initialization for 'ts') [enabled by default]
drivers/input/touchscreen/ad7879.c: In function 'ad7879_gpio_set_value':
drivers/input/touchscreen/ad7879.c:431:22: warning: initialization from incompatible pointer type [enabled by default]
drivers/input/touchscreen/ad7879.c:431:22: warning: (near initialization for 'ts') [enabled by default]
drivers/input/touchscreen/ad7879.c: In function 'ad7879_gpio_add':
drivers/input/touchscreen/ad7879.c:462:3: error: implicit declaration of function 'gpiochip_add' [-Werror=implicit-function-declaration]
drivers/input/touchscreen/ad7879.c: In function 'ad7879_gpio_remove':
drivers/input/touchscreen/ad7879.c:477:3: error: implicit declaration of function 'gpiochip_remove' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors

vim +179 drivers/leds/leds-tca6507.c

a6d511e5 NeilBrown 2012-01-10  163  		int time_use, level_use;
a6d511e5 NeilBrown 2012-01-10  164  	} bank[3];
a6d511e5 NeilBrown 2012-01-10  165  	struct i2c_client	*client;
a6d511e5 NeilBrown 2012-01-10  166  	struct work_struct	work;
a6d511e5 NeilBrown 2012-01-10  167  	spinlock_t		lock;
a6d511e5 NeilBrown 2012-01-10  168  
a6d511e5 NeilBrown 2012-01-10  169  	struct tca6507_led {
a6d511e5 NeilBrown 2012-01-10  170  		struct tca6507_chip	*chip;
a6d511e5 NeilBrown 2012-01-10  171  		struct led_classdev	led_cdev;
a6d511e5 NeilBrown 2012-01-10  172  		int			num;
a6d511e5 NeilBrown 2012-01-10  173  		int			ontime, offtime;
a6d511e5 NeilBrown 2012-01-10  174  		int			on_dflt, off_dflt;
a6d511e5 NeilBrown 2012-01-10  175  		int			bank;	/* Bank used, or -1 */
a6d511e5 NeilBrown 2012-01-10  176  		int			blink;	/* Set if hardware-blinking */
a6d511e5 NeilBrown 2012-01-10  177  	} leds[NUM_LEDS];
a6d511e5 NeilBrown 2012-01-10  178  #ifdef CONFIG_GPIOLIB
a6d511e5 NeilBrown 2012-01-10 @179  	struct gpio_chip		gpio;
a6d511e5 NeilBrown 2012-01-10  180  	const char			*gpio_name[NUM_LEDS];
a6d511e5 NeilBrown 2012-01-10  181  	int				gpio_map[NUM_LEDS];
a6d511e5 NeilBrown 2012-01-10  182  #endif
a6d511e5 NeilBrown 2012-01-10  183  };
a6d511e5 NeilBrown 2012-01-10  184  
a6d511e5 NeilBrown 2012-01-10  185  static const struct i2c_device_id tca6507_id[] = {
a6d511e5 NeilBrown 2012-01-10  186  	{ "tca6507" },
a6d511e5 NeilBrown 2012-01-10  187  	{ }

The code at line 179 was first introduced by commit:
a6d511e leds: add driver for TCA6507 LED controller


---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
