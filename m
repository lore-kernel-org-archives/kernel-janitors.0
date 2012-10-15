From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 15 Oct 2012 08:00:42 +0000
Subject: [jdelvare-staging:i2c-for-linus 9/15] drivers/tty/serial/max310x.c:277:19: error: field 'gpio' has i
Message-Id: <20121015080042.GC31880@localhost>
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

drivers/tty/serial/max310x.c:277:19: error: field 'gpio' has incomplete type
drivers/tty/serial/max310x.c: In function 'max310x_gpio_get':
drivers/tty/serial/max310x.c:941:27: warning: initialization from incompatible pointer type [enabled by default]
drivers/tty/serial/max310x.c:941:27: warning: (near initialization for 's') [enabled by default]
drivers/tty/serial/max310x.c: In function 'max310x_gpio_set':
drivers/tty/serial/max310x.c:952:27: warning: initialization from incompatible pointer type [enabled by default]
drivers/tty/serial/max310x.c:952:27: warning: (near initialization for 's') [enabled by default]
drivers/tty/serial/max310x.c: In function 'max310x_gpio_direction_input':
drivers/tty/serial/max310x.c:962:27: warning: initialization from incompatible pointer type [enabled by default]
drivers/tty/serial/max310x.c:962:27: warning: (near initialization for 's') [enabled by default]
drivers/tty/serial/max310x.c: In function 'max310x_gpio_direction_output':
drivers/tty/serial/max310x.c:976:27: warning: initialization from incompatible pointer type [enabled by default]
drivers/tty/serial/max310x.c:976:27: warning: (near initialization for 's') [enabled by default]
drivers/tty/serial/max310x.c: In function 'max310x_probe':
drivers/tty/serial/max310x.c:1181:3: error: implicit declaration of function 'gpiochip_add' [-Werror=implicit-function-declaration]
drivers/tty/serial/max310x.c: In function 'max310x_remove':
drivers/tty/serial/max310x.c:1223:3: error: implicit declaration of function 'gpiochip_remove' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors

vim +277 drivers/tty/serial/max310x.c

f6544418 Alexander Shiyan 2012-08-06  261  
f6544418 Alexander Shiyan 2012-08-06  262  /* Supported chip types */
f6544418 Alexander Shiyan 2012-08-06  263  enum {
f6544418 Alexander Shiyan 2012-08-06  264  	MAX310X_TYPE_MAX3107	= 3107,
f6544418 Alexander Shiyan 2012-08-06  265  	MAX310X_TYPE_MAX3108	= 3108,
f6544418 Alexander Shiyan 2012-08-06  266  };
f6544418 Alexander Shiyan 2012-08-06  267  
f6544418 Alexander Shiyan 2012-08-06  268  struct max310x_port {
f6544418 Alexander Shiyan 2012-08-06  269  	struct uart_driver	uart;
f6544418 Alexander Shiyan 2012-08-06  270  	struct uart_port	port;
f6544418 Alexander Shiyan 2012-08-06  271  
f6544418 Alexander Shiyan 2012-08-06  272  	const char		*name;
f6544418 Alexander Shiyan 2012-08-06  273  	int			uartclk;
f6544418 Alexander Shiyan 2012-08-06  274  
f6544418 Alexander Shiyan 2012-08-06  275  	unsigned int		nr_gpio;
f6544418 Alexander Shiyan 2012-08-06  276  #ifdef CONFIG_GPIOLIB
f6544418 Alexander Shiyan 2012-08-06 @277  	struct gpio_chip	gpio;
f6544418 Alexander Shiyan 2012-08-06  278  #endif
f6544418 Alexander Shiyan 2012-08-06  279  
f6544418 Alexander Shiyan 2012-08-06  280  	struct regmap		*regmap;
f6544418 Alexander Shiyan 2012-08-06  281  	struct regmap_config	regcfg;
f6544418 Alexander Shiyan 2012-08-06  282  
f6544418 Alexander Shiyan 2012-08-06  283  	struct workqueue_struct	*wq;
f6544418 Alexander Shiyan 2012-08-06  284  	struct work_struct	tx_work;
f6544418 Alexander Shiyan 2012-08-06  285  

The code at line 277 was first introduced by commit:
f654441 serial: New serial driver MAX310X


---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
