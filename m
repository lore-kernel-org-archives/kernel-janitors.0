From: Jean Delvare <khali@linux-fr.org>
Date: Mon, 15 Oct 2012 09:13:22 +0000
Subject: Re: [jdelvare-staging:i2c-for-linus 9/15]  drivers/tty/serial/max310x.c:277:19: error: field 'gpio'
Message-Id: <20121015111322.4445bb0a@endymion.delvare>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121009092343.7572fb53@endymion.delvare>
In-Reply-To: <20121009092343.7572fb53@endymion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 15 Oct 2012 16:00:42 +0800, Fengguang Wu wrote:
> Hi Jean,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jdelvare/staging.git i2c-for-linus
> head:   c415b303a704e5c5f766fc0404093910c36cc4ab
> commit: 3ad7ea18ae8c7ddda46b7276e0bda73e707ea9c1 [9/15] i2c-i801: Support SMBus multiplexing on Asus Z8 series
> config: parisc-allyesconfig # make ARCH=parisc allyesconfig
> 
> 
> All error/warnings:
> 
> drivers/tty/serial/max310x.c:277:19: error: field 'gpio' has incomplete type
> drivers/tty/serial/max310x.c: In function 'max310x_gpio_get':
> drivers/tty/serial/max310x.c:941:27: warning: initialization from incompatible pointer type [enabled by default]
> drivers/tty/serial/max310x.c:941:27: warning: (near initialization for 's') [enabled by default]
> drivers/tty/serial/max310x.c: In function 'max310x_gpio_set':
> drivers/tty/serial/max310x.c:952:27: warning: initialization from incompatible pointer type [enabled by default]
> drivers/tty/serial/max310x.c:952:27: warning: (near initialization for 's') [enabled by default]
> drivers/tty/serial/max310x.c: In function 'max310x_gpio_direction_input':
> drivers/tty/serial/max310x.c:962:27: warning: initialization from incompatible pointer type [enabled by default]
> drivers/tty/serial/max310x.c:962:27: warning: (near initialization for 's') [enabled by default]
> drivers/tty/serial/max310x.c: In function 'max310x_gpio_direction_output':
> drivers/tty/serial/max310x.c:976:27: warning: initialization from incompatible pointer type [enabled by default]
> drivers/tty/serial/max310x.c:976:27: warning: (near initialization for 's') [enabled by default]
> drivers/tty/serial/max310x.c: In function 'max310x_probe':
> drivers/tty/serial/max310x.c:1181:3: error: implicit declaration of function 'gpiochip_add' [-Werror=implicit-function-declaration]
> drivers/tty/serial/max310x.c: In function 'max310x_remove':
> drivers/tty/serial/max310x.c:1223:3: error: implicit declaration of function 'gpiochip_remove' [-Werror=implicit-function-declaration]
> cc1: some warnings being treated as errors

Thanks for reporting. Please check if the following patch fixes it:

From: Jean Delvare <khali@linux-fr.org>
Subject: i2c-i801: Simplify dependency towards GPIOLIB

Arbitrarily selecting GPIOLIB causes trouble on some architectures,
so don't do that. Instead, just make the optional multiplexing code
depend on CONFIG_I2C_MUX_GPIO instead of CONFIG_I2C_MUX for now. We
can revisit if the i2c-i801 driver ever supports other multiplexing
flavors.

Also make that optional code depend on DMI, as it won't do anything
without that.

Signed-off-by: Jean Delvare <khali@linux-fr.org>
Cc: Fengguang Wu <fengguang.wu@intel.com>
---
 drivers/i2c/busses/Kconfig    |    1 -
 drivers/i2c/busses/i2c-i801.c |    9 ++++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

--- linux-3.7-rc1.orig/drivers/i2c/busses/Kconfig	2012-10-15 08:58:56.000000000 +0200
+++ linux-3.7-rc1/drivers/i2c/busses/Kconfig	2012-10-15 10:41:25.071318527 +0200
@@ -81,7 +81,6 @@ config I2C_I801
 	tristate "Intel 82801 (ICH/PCH)"
 	depends on PCI
 	select CHECK_SIGNATURE if X86 && DMI
-	select GPIOLIB if I2C_MUX
 	help
 	  If you say yes to this option, support will be included for the Intel
 	  801 family of mainboard I2C interfaces.  Specifically, the following
--- linux-3.7-rc1.orig/drivers/i2c/busses/i2c-i801.c	2012-10-15 09:34:42.000000000 +0200
+++ linux-3.7-rc1/drivers/i2c/busses/i2c-i801.c	2012-10-15 11:08:26.747445938 +0200
@@ -83,7 +83,8 @@
 #include <linux/err.h>
 #include <linux/of_i2c.h>
 
-#if defined CONFIG_I2C_MUX || defined CONFIG_I2C_MUX_MODULE
+#if (defined CONFIG_I2C_MUX_GPIO || defined CONFIG_I2C_MUX_GPIO_MODULE) && \
+		defined CONFIG_DMI
 #include <linux/gpio.h>
 #include <linux/i2c-mux-gpio.h>
 #include <linux/platform_device.h>
@@ -193,7 +194,8 @@ struct i801_priv {
 	int len;
 	u8 *data;
 
-#if defined CONFIG_I2C_MUX || defined CONFIG_I2C_MUX_MODULE
+#if (defined CONFIG_I2C_MUX_GPIO || defined CONFIG_I2C_MUX_GPIO_MODULE) && \
+		defined CONFIG_DMI
 	const struct i801_mux_config *mux_drvdata;
 	struct platform_device *mux_pdev;
 #endif
@@ -922,7 +924,8 @@ static void __init input_apanel_init(voi
 static void __devinit i801_probe_optional_slaves(struct i801_priv *priv) {}
 #endif	/* CONFIG_X86 && CONFIG_DMI */
 
-#if defined CONFIG_I2C_MUX || defined CONFIG_I2C_MUX_MODULE
+#if (defined CONFIG_I2C_MUX_GPIO || defined CONFIG_I2C_MUX_GPIO_MODULE) && \
+		defined CONFIG_DMI
 static struct i801_mux_config i801_mux_config_asus_z8_d12 = {
 	.gpio_chip = "gpio_ich",
 	.values = { 0x02, 0x03 },


-- 
Jean Delvare
