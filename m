From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 16 Oct 2012 03:18:58 +0000
Subject: [jdelvare-staging:i2c-for-linus 9/15] drivers/input/keyboard/adp5588-keys.c:52:19: error: field 'gc'
Message-Id: <20121016031858.GB16754@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121008071452.GA29214@localhost>
In-Reply-To: <20121008071452.GA29214@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Jean,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jdelvare/staging.git i2c-for-linus
head:   c415b303a704e5c5f766fc0404093910c36cc4ab
commit: 3ad7ea18ae8c7ddda46b7276e0bda73e707ea9c1 [9/15] i2c-i801: Support SMBus multiplexing on Asus Z8 series
config: parisc-allyesconfig # make ARCH=parisc allyesconfig

All error/warnings:

drivers/input/keyboard/adp5588-keys.c:52:19: error: field 'gc' has incomplete type
drivers/input/keyboard/adp5588-keys.c: In function 'adp5588_gpio_get_value':
drivers/input/keyboard/adp5588-keys.c:77:30: warning: initialization from incompatible pointer type [enabled by default]
drivers/input/keyboard/adp5588-keys.c:77:30: warning: (near initialization for 'kpad') [enabled by default]
drivers/input/keyboard/adp5588-keys.c: In function 'adp5588_gpio_set_value':
drivers/input/keyboard/adp5588-keys.c:87:30: warning: initialization from incompatible pointer type [enabled by default]
drivers/input/keyboard/adp5588-keys.c:87:30: warning: (near initialization for 'kpad') [enabled by default]
drivers/input/keyboard/adp5588-keys.c: In function 'adp5588_gpio_direction_input':
drivers/input/keyboard/adp5588-keys.c:106:30: warning: initialization from incompatible pointer type [enabled by default]
drivers/input/keyboard/adp5588-keys.c:106:30: warning: (near initialization for 'kpad') [enabled by default]
drivers/input/keyboard/adp5588-keys.c: In function 'adp5588_gpio_direction_output':
drivers/input/keyboard/adp5588-keys.c:124:30: warning: initialization from incompatible pointer type [enabled by default]
drivers/input/keyboard/adp5588-keys.c:124:30: warning: (near initialization for 'kpad') [enabled by default]
drivers/input/keyboard/adp5588-keys.c: In function 'adp5588_gpio_add':
drivers/input/keyboard/adp5588-keys.c:204:2: error: implicit declaration of function 'gpiochip_add' [-Werror=implicit-function-declaration]
drivers/input/keyboard/adp5588-keys.c: In function 'adp5588_gpio_remove':
drivers/input/keyboard/adp5588-keys.c:245:2: error: implicit declaration of function 'gpiochip_remove' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors
--
drivers/input/keyboard/adp5589-keys.c:243:19: error: field 'gc' has incomplete type
drivers/input/keyboard/adp5589-keys.c: In function 'adp5589_gpio_get_value':
drivers/input/keyboard/adp5589-keys.c:391:30: warning: initialization from incompatible pointer type [enabled by default]
drivers/input/keyboard/adp5589-keys.c:391:30: warning: (near initialization for 'kpad') [enabled by default]
drivers/input/keyboard/adp5589-keys.c: In function 'adp5589_gpio_set_value':
drivers/input/keyboard/adp5589-keys.c:403:30: warning: initialization from incompatible pointer type [enabled by default]
drivers/input/keyboard/adp5589-keys.c:403:30: warning: (near initialization for 'kpad') [enabled by default]
drivers/input/keyboard/adp5589-keys.c: In function 'adp5589_gpio_direction_input':
drivers/input/keyboard/adp5589-keys.c:422:30: warning: initialization from incompatible pointer type [enabled by default]
drivers/input/keyboard/adp5589-keys.c:422:30: warning: (near initialization for 'kpad') [enabled by default]
drivers/input/keyboard/adp5589-keys.c: In function 'adp5589_gpio_direction_output':
drivers/input/keyboard/adp5589-keys.c:442:30: warning: initialization from incompatible pointer type [enabled by default]
drivers/input/keyboard/adp5589-keys.c:442:30: warning: (near initialization for 'kpad') [enabled by default]
drivers/input/keyboard/adp5589-keys.c: In function 'adp5589_gpio_add':
drivers/input/keyboard/adp5589-keys.c:529:2: error: implicit declaration of function 'gpiochip_add' [-Werror=implicit-function-declaration]
drivers/input/keyboard/adp5589-keys.c: In function 'adp5589_gpio_remove':
drivers/input/keyboard/adp5589-keys.c:571:2: error: implicit declaration of function 'gpiochip_remove' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors

vim +52 drivers/input/keyboard/adp5588-keys.c

88751dd6 Michael Hennerich 2009-09-17  36   * since the Event Counter Register updated 25ms after the interrupt
88751dd6 Michael Hennerich 2009-09-17  37   * asserted.
88751dd6 Michael Hennerich 2009-09-17  38   */
88751dd6 Michael Hennerich 2009-09-17  39  #define WA_DELAYED_READOUT_REVID(rev)		((rev) < 4)
88751dd6 Michael Hennerich 2009-09-17  40  
88751dd6 Michael Hennerich 2009-09-17  41  struct adp5588_kpad {
88751dd6 Michael Hennerich 2009-09-17  42  	struct i2c_client *client;
88751dd6 Michael Hennerich 2009-09-17  43  	struct input_dev *input;
88751dd6 Michael Hennerich 2009-09-17  44  	struct delayed_work work;
88751dd6 Michael Hennerich 2009-09-17  45  	unsigned long delay;
88751dd6 Michael Hennerich 2009-09-17  46  	unsigned short keycode[ADP5588_KEYMAPSIZE];
69a4af60 Xiaolong CHEN     2010-06-24  47  	const struct adp5588_gpi_map *gpimap;
69a4af60 Xiaolong CHEN     2010-06-24  48  	unsigned short gpimapsize;
ba9f507a Xiaolong Chen     2010-07-26  49  #ifdef CONFIG_GPIOLIB
95716c0d Michael Hennerich 2010-11-02  50  	unsigned char gpiomap[ADP5588_MAXGPIO];
ba9f507a Xiaolong Chen     2010-07-26  51  	bool export_gpio;
ba9f507a Xiaolong Chen     2010-07-26 @52  	struct gpio_chip gc;
ba9f507a Xiaolong Chen     2010-07-26  53  	struct mutex gpio_lock;	/* Protect cached dir, dat_out */
ba9f507a Xiaolong Chen     2010-07-26  54  	u8 dat_out[3];
ba9f507a Xiaolong Chen     2010-07-26  55  	u8 dir[3];
ba9f507a Xiaolong Chen     2010-07-26  56  #endif
88751dd6 Michael Hennerich 2009-09-17  57  };
88751dd6 Michael Hennerich 2009-09-17  58  
88751dd6 Michael Hennerich 2009-09-17  59  static int adp5588_read(struct i2c_client *client, u8 reg)
88751dd6 Michael Hennerich 2009-09-17  60  {

The code at line 52 was first introduced by commit:
ba9f507 Input: adp5588-keys - export unused GPIO pins

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
