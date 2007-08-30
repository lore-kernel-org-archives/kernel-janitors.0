From: andre@finow14.de
Date: Thu, 30 Aug 2007 10:40:38 +0000
Subject: [KJ][patch 3/3] VIDC20: use abs() from kernel.h instead of own definition
Message-Id: <20070830104038.GD14925@ahaupt-debian-vm.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070830102551.131398783@finow14.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Andre Haupt <andre@finow14.de>, rmk@arm.linux.org.uk

From: Andre Haupt <andre@finow14.de>
Signed-off-by: Andre Haupt <andre@finow14.de>
---
Index: linus/sound/oss/vidc.c
=================================--- linus.orig/sound/oss/vidc.c	2007-08-30 11:57:13.000000000 +0200
+++ linus/sound/oss/vidc.c	2007-08-30 11:57:53.000000000 +0200
@@ -185,8 +185,6 @@ static unsigned int vidc_audio_set_forma
 	return vidc_audio_format;
 }
 
-#define my_abs(i) ((i)<0 ? -(i) : (i))
-
 static int vidc_audio_set_speed(int dev, int rate)
 {
 	if (rate) {
@@ -214,8 +212,8 @@ static int vidc_audio_set_speed(int dev,
 		rate_ext = VIDC_SOUND_CLOCK_EXT / hwrate_ext;
 
 		/* Chose between external and internal clock */
-		diff_int = my_abs(rate_ext-rate);
-		diff_ext = my_abs(rate_int-rate);
+		diff_int = abs(rate_ext-rate);
+		diff_ext = abs(rate_int-rate);
 		if (diff_ext < diff_int) {
 			/*printk("VIDC: external %d %d %d\n", rate, rate_ext, hwrate_ext);*/
 			hwrate=hwrate_ext;

--
