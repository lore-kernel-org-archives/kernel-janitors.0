From: James Nelson <james4765@gmail.com>
Date: Fri, 08 Sep 2006 01:58:32 +0000
Subject: [KJ] [PATCH 19/72] arm: add KERN_ constants to
Message-Id: <20060908015832.10114.84986.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/arm/mach-omap1/board-nokia770.c b/arch/arm/mach-omap1/board-nokia770.c
index 02b980d..1367a5b 100644
--- a/arch/arm/mach-omap1/board-nokia770.c
+++ b/arch/arm/mach-omap1/board-nokia770.c
@@ -186,7 +186,7 @@ static void nokia770_audio_pwr_up(void)
 		omap_set_gpio_dataout(AMPLIFIER_CTRL_GPIO, 1);
 	else
 		/* HP connected, do not turn on amplifier */
-		printk("HP connected\n");
+		pr_info("HP connected\n");
 }
 
 static void codec_delayed_power_down(void *arg)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
