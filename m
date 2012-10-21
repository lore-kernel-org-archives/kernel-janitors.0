From: Fengguang Wu <fengguang.wu@intel.com>
Date: Sun, 21 Oct 2012 01:30:18 +0000
Subject: [jdelvare-staging:i2c-for-linus 9/15] drivers/leds/leds-pca9532.c:46:19: error: field 'gpio' has inc
Message-Id: <20121021013018.GA692@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121008071452.GA29214@localhost>
In-Reply-To: <20121008071452.GA29214@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Jean,

FYI, kernel build failed on (and also in upstream)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jdelvare/staging.git i2c-for-linus
head:   c415b303a704e5c5f766fc0404093910c36cc4ab
commit: 3ad7ea18ae8c7ddda46b7276e0bda73e707ea9c1 [9/15] i2c-i801: Support SMBus multiplexing on Asus Z8 series
config: parisc-allyesconfig # make ARCH=parisc allyesconfig

All error/warnings:

drivers/leds/leds-pca9532.c:46:19: error: field 'gpio' has incomplete type
drivers/leds/leds-pca9532.c: In function 'pca9532_gpio_request_pin':
drivers/leds/leds-pca9532.c:248:30: warning: initialization from incompatible pointer type [enabled by default]
drivers/leds/leds-pca9532.c:248:30: warning: (near initialization for 'data') [enabled by default]
drivers/leds/leds-pca9532.c: In function 'pca9532_gpio_set_value':
drivers/leds/leds-pca9532.c:259:30: warning: initialization from incompatible pointer type [enabled by default]
drivers/leds/leds-pca9532.c:259:30: warning: (near initialization for 'data') [enabled by default]
drivers/leds/leds-pca9532.c: In function 'pca9532_gpio_get_value':
drivers/leds/leds-pca9532.c:272:30: warning: initialization from incompatible pointer type [enabled by default]
drivers/leds/leds-pca9532.c:272:30: warning: (near initialization for 'data') [enabled by default]
drivers/leds/leds-pca9532.c: In function 'pca9532_destroy_devices':
drivers/leds/leds-pca9532.c:324:3: error: implicit declaration of function 'gpiochip_remove' [-Werror=implicit-function-declaration]
drivers/leds/leds-pca9532.c: In function 'pca9532_configure':
drivers/leds/leds-pca9532.c:427:3: error: implicit declaration of function 'gpiochip_add' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors

vim +46 drivers/leds/leds-pca9532.c

3dbf622c Jan Weitzel      2011-05-24  30  #define LED_REG(m, led)		(PCA9532_REG_OFFSET(m) + 0x5 + (led >> 2))
3dbf622c Jan Weitzel      2011-05-24  31  #define LED_NUM(led)		(led & 0x3)
e14fa824 Riku Voipio      2008-05-31  32  
e14fa824 Riku Voipio      2008-05-31  33  #define ldev_to_led(c)       container_of(c, struct pca9532_led, ldev)
e14fa824 Riku Voipio      2008-05-31  34  
3dbf622c Jan Weitzel      2011-05-24  35  struct pca9532_chip_info {
3dbf622c Jan Weitzel      2011-05-24  36  	u8	num_leds;
3dbf622c Jan Weitzel      2011-05-24  37  };
3dbf622c Jan Weitzel      2011-05-24  38  
e14fa824 Riku Voipio      2008-05-31  39  struct pca9532_data {
e14fa824 Riku Voipio      2008-05-31  40  	struct i2c_client *client;
e14fa824 Riku Voipio      2008-05-31  41  	struct pca9532_led leds[16];
e14fa824 Riku Voipio      2008-05-31  42  	struct mutex update_lock;
85c5204a Richard Purdie   2009-09-07  43  	struct input_dev *idev;
07172d2b Antonio Ospite   2009-06-19  44  	struct work_struct work;
3c1ab50d Joachim Eastwood 2011-05-24  45  #ifdef CONFIG_LEDS_PCA9532_GPIO
3c1ab50d Joachim Eastwood 2011-05-24 @46  	struct gpio_chip gpio;
3c1ab50d Joachim Eastwood 2011-05-24  47  #endif
3dbf622c Jan Weitzel      2011-05-24  48  	const struct pca9532_chip_info *chip_info;
e14fa824 Riku Voipio      2008-05-31  49  	u8 pwm[2];
e14fa824 Riku Voipio      2008-05-31  50  	u8 psc[2];
e14fa824 Riku Voipio      2008-05-31  51  };
e14fa824 Riku Voipio      2008-05-31  52  
e14fa824 Riku Voipio      2008-05-31  53  static int pca9532_probe(struct i2c_client *client,
e14fa824 Riku Voipio      2008-05-31  54  	const struct i2c_device_id *id);

The code at line 46 was first introduced by commit:
3c1ab50 drivers/leds/leds-pca9532.c: add gpio capability


---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
