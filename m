From: Jim Cromie <jcromie@divsol.com>
Date: Sun, 03 Jul 2005 14:08:15 +0000
Subject: [KJ] cleanup indenting on drivers/char/Makefile
Message-Id: <42C7F14F.7090408@divsol.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------030800060801020801000500"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------030800060801020801000500
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

items in makefile are partially tabbed into columns,
this patch finishes that indenting, minus an ifeq block,
which I think should stand out, so I left it.

[jimc@harpo lxbuild]$ diffstat drvr-chr-makefile-whitespace.patch
 Makefile |   70 
+++++++++++++++++++++++++++++++--------------------------------
 1 files changed, 35 insertions(+), 35 deletions(-)


Signed-of-by:  Jim Cromie <jcromie@divsol.com>

--------------030800060801020801000500
Content-Type: text/plain;
 name="drvr-chr-makefile-whitespace.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="drvr-chr-makefile-whitespace.patch"

--- linux-2.6.13-rc1g5/drivers/char/Makefile~	2005-07-03 07:53:54.000000000 -0600
+++ linux-2.6.13-rc1g5/drivers/char/Makefile	2005-07-03 08:02:23.000000000 -0600
@@ -44,51 +44,51 @@
 obj-$(CONFIG_RAW_DRIVER)	+= raw.o
 obj-$(CONFIG_SGI_SNSC)		+= snsc.o snsc_event.o
 obj-$(CONFIG_MMTIMER)		+= mmtimer.o
-obj-$(CONFIG_VIOCONS) += viocons.o
+obj-$(CONFIG_VIOCONS)		+= viocons.o
 obj-$(CONFIG_VIOTAPE)		+= viotape.o
 obj-$(CONFIG_HVCS)		+= hvcs.o
 obj-$(CONFIG_SGI_MBCS)		+= mbcs.o
 
-obj-$(CONFIG_PRINTER) += lp.o
-obj-$(CONFIG_TIPAR) += tipar.o
+obj-$(CONFIG_PRINTER)		+= lp.o
+obj-$(CONFIG_TIPAR)		+= tipar.o
 
-obj-$(CONFIG_DTLK) += dtlk.o
-obj-$(CONFIG_R3964) += n_r3964.o
-obj-$(CONFIG_APPLICOM) += applicom.o
-obj-$(CONFIG_SONYPI) += sonypi.o
-obj-$(CONFIG_RTC) += rtc.o
-obj-$(CONFIG_HPET) += hpet.o
-obj-$(CONFIG_GEN_RTC) += genrtc.o
-obj-$(CONFIG_EFI_RTC) += efirtc.o
-obj-$(CONFIG_SGI_DS1286) += ds1286.o
-obj-$(CONFIG_SGI_IP27_RTC) += ip27-rtc.o
-obj-$(CONFIG_DS1302) += ds1302.o
-obj-$(CONFIG_S3C2410_RTC) += s3c2410-rtc.o
-obj-$(CONFIG_RTC_VR41XX) += vr41xx_rtc.o
+obj-$(CONFIG_DTLK)		+= dtlk.o
+obj-$(CONFIG_R3964)		+= n_r3964.o
+obj-$(CONFIG_APPLICOM)		+= applicom.o
+obj-$(CONFIG_SONYPI)		+= sonypi.o
+obj-$(CONFIG_RTC)		+= rtc.o
+obj-$(CONFIG_HPET)		+= hpet.o
+obj-$(CONFIG_GEN_RTC)		+= genrtc.o
+obj-$(CONFIG_EFI_RTC)		+= efirtc.o
+obj-$(CONFIG_SGI_DS1286)	+= ds1286.o
+obj-$(CONFIG_SGI_IP27_RTC)	+= ip27-rtc.o
+obj-$(CONFIG_DS1302)		+= ds1302.o
+obj-$(CONFIG_S3C2410_RTC)	+= s3c2410-rtc.o
+obj-$(CONFIG_RTC_VR41XX)	+= vr41xx_rtc.o
 ifeq ($(CONFIG_GENERIC_NVRAM),y)
   obj-$(CONFIG_NVRAM) += generic_nvram.o
 else
   obj-$(CONFIG_NVRAM) += nvram.o
 endif
-obj-$(CONFIG_TOSHIBA) += toshiba.o
-obj-$(CONFIG_I8K) += i8k.o
-obj-$(CONFIG_DS1620) += ds1620.o
-obj-$(CONFIG_HW_RANDOM) += hw_random.o
-obj-$(CONFIG_FTAPE) += ftape/
-obj-$(CONFIG_COBALT_LCD) += lcd.o
-obj-$(CONFIG_PPDEV) += ppdev.o
-obj-$(CONFIG_NWBUTTON) += nwbutton.o
-obj-$(CONFIG_NWFLASH) += nwflash.o
-obj-$(CONFIG_SCx200_GPIO) += scx200_gpio.o
-obj-$(CONFIG_GPIO_VR41XX) += vr41xx_giu.o
-obj-$(CONFIG_TANBAC_TB0219) += tb0219.o
-
-obj-$(CONFIG_WATCHDOG)	+= watchdog/
-obj-$(CONFIG_MWAVE) += mwave/
-obj-$(CONFIG_AGP) += agp/
-obj-$(CONFIG_DRM) += drm/
-obj-$(CONFIG_PCMCIA) += pcmcia/
-obj-$(CONFIG_IPMI_HANDLER) += ipmi/
+obj-$(CONFIG_TOSHIBA)		+= toshiba.o
+obj-$(CONFIG_I8K)		+= i8k.o
+obj-$(CONFIG_DS1620)		+= ds1620.o
+obj-$(CONFIG_HW_RANDOM)		+= hw_random.o
+obj-$(CONFIG_FTAPE)		+= ftape/
+obj-$(CONFIG_COBALT_LCD)	+= lcd.o
+obj-$(CONFIG_PPDEV)		+= ppdev.o
+obj-$(CONFIG_NWBUTTON)		+= nwbutton.o
+obj-$(CONFIG_NWFLASH)		+= nwflash.o
+obj-$(CONFIG_SCx200_GPIO)	+= scx200_gpio.o
+obj-$(CONFIG_GPIO_VR41XX)	+= vr41xx_giu.o
+obj-$(CONFIG_TANBAC_TB0219)	+= tb0219.o
+
+obj-$(CONFIG_WATCHDOG)		+= watchdog/
+obj-$(CONFIG_MWAVE)		+= mwave/
+obj-$(CONFIG_AGP)		+= agp/
+obj-$(CONFIG_DRM)		+= drm/
+obj-$(CONFIG_PCMCIA)		+= pcmcia/
+obj-$(CONFIG_IPMI_HANDLER)	+= ipmi/
 
 obj-$(CONFIG_HANGCHECK_TIMER) += hangcheck-timer.o
 obj-$(CONFIG_TCG_TPM) += tpm/

--------------030800060801020801000500
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------030800060801020801000500--
