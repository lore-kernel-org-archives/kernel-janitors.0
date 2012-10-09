From: Jean Delvare <khali@linux-fr.org>
Date: Tue, 09 Oct 2012 07:23:43 +0000
Subject: Re: [jdelvare-staging:i2c-for-linus 9/15]  drivers/i2c/busses/i2c-i801.c:1014:21: error: dereferenci
Message-Id: <20121009092343.7572fb53@endymion.delvare>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Fengguang,

On Mon, 8 Oct 2012 15:14:52 +0800, Fengguang Wu wrote:
> Hi Jean,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jdelvare/staging.git i2c-for-linus
> head:   c415b303a704e5c5f766fc0404093910c36cc4ab
> commit: 3ad7ea18ae8c7ddda46b7276e0bda73e707ea9c1 [9/15] i2c-i801: Support SMBus multiplexing on Asus Z8 series
> config: parisc-allyesconfig
> 
> It's also failing in Linus' master and linux-next.
> 
> All error/warnings:
> 
> drivers/i2c/busses/i2c-i801.c: In function 'match_gpio_chip_by_label':
> drivers/i2c/busses/i2c-i801.c:1014:21: error: dereferencing pointer to incomplete type
> drivers/i2c/busses/i2c-i801.c: In function 'i801_add_mux':
> drivers/i2c/busses/i2c-i801.c:1031:2: error: implicit declaration of function 'gpiochip_find' [-Werror=implicit-function-declaration]
> drivers/i2c/busses/i2c-i801.c:1031:7: warning: assignment makes pointer from integer without a cast [enabled by default]
> drivers/i2c/busses/i2c-i801.c:1050:27: error: dereferencing pointer to incomplete type
> drivers/i2c/busses/i2c-i801.c: In function 'match_gpio_chip_by_label':
> drivers/i2c/busses/i2c-i801.c:1015:1: warning: control reaches end of non-void function [-Wreturn-type]
> cc1: some warnings being treated as errors
> 
> vim +1014 drivers/i2c/busses/i2c-i801.c
> 
> 3ad7ea18 Jean Delvare 2012-10-05  1008  	{ }
> 3ad7ea18 Jean Delvare 2012-10-05  1009  };
> 3ad7ea18 Jean Delvare 2012-10-05  1010  
> 3ad7ea18 Jean Delvare 2012-10-05  1011  static int __devinit match_gpio_chip_by_label(struct gpio_chip *chip,
> 3ad7ea18 Jean Delvare 2012-10-05  1012  					      void *data)
> 3ad7ea18 Jean Delvare 2012-10-05  1013  {
> 3ad7ea18 Jean Delvare 2012-10-05 @1014  	return !strcmp(chip->label, data);
> 3ad7ea18 Jean Delvare 2012-10-05  1015  }
> 3ad7ea18 Jean Delvare 2012-10-05  1016  
> 3ad7ea18 Jean Delvare 2012-10-05  1017  /* Setup multiplexing if needed */

This code was removed by a later patch (i2c-i801: Let i2c-mux-gpio find
the GPIO chip) so investigating this build failure has little interest
at this point.

If you can still reproduce a similar build failure with Linus' latest
kernel (which has this second patch included) or today's linux-next
then please send the new error log together with the config file
triggering it. I tried hard to reproduce the problem but did not
succeed so far.

-- 
Jean Delvare
