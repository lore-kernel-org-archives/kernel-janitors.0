From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 20 Sep 2012 21:22:48 +0000
Subject: [broonie-misc:spi-next 28/43] drivers/spi/spi-gpio.c:389:79: error: parameter name omitted
Message-Id: <20120920212248.GA5446@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Daniel,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git spi-next
head:   337c422cf74b1ae46969395847795de953e66958
commit: 38ab18caa0ad9c844ba60f9618c5de6d6954da3e [28/43] spi: spi-gpio: Add DT bindings
config: x86_64-allmodconfig

All related error/warning messages:

drivers/spi/spi-gpio.c: In function 'spi_gpio_setup':
drivers/spi/spi-gpio.c:255:8: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
drivers/spi/spi-gpio.c: In function 'spi_probe_dt':
drivers/spi/spi-gpio.c:389:79: error: parameter name omitted
drivers/spi/spi-gpio.c: In function 'spi_gpio_probe':
drivers/spi/spi-gpio.c:404:2: error: implicit declaration of function 'spi_gpio_probe_dt' [-Werror=implicit-function-declaration]
cc1: some warnings being treated as errors

vim +389 drivers/spi/spi-gpio.c
   383	
   384	error_free:
   385		devm_kfree(&pdev->dev, pdata);
   386		return ret;
   387	}
   388	#else
 > 389	static inline int spi_probe_dt(struct platform_device *)
   390	{
   391		return 0;
   392	}

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation
