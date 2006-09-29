From: Hashem Masoud <masoudh@batelco.com.bh>
Date: Fri, 29 Sep 2006 18:59:39 +0000
Subject: Re: [KJ] [PATCH] check return code for request_region() in
Message-Id: <20060929185939.GA8167@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060928103514.GA12240@localhost.localdomain>
In-Reply-To: <20060928103514.GA12240@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> Now, what I *was* talking about was this bit of your patch:  "if
> !(request_region"
> That should have been  "if (!request_region"

This is a corrected patch compile-tested with allmodconfig and make sound/oss/ .

Signed-off-by: Hashem Masoud <masoudh@batelco.com.bh>
---
 gus_wave.c |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)
---
diff -urp linux-2.6.17.13/sound/oss/gus_wave.c linux/sound/oss/gus_wave.c
--- linux-2.6.17.13/sound/oss/gus_wave.c	2006-09-27 19:03:42.000000000 -0300
+++ linux/sound/oss/gus_wave.c	2006-09-28 20:17:41.093694160 -0300
@@ -2938,7 +2938,10 @@ void __init gus_wave_init(struct address
 			model_num = "3.7";
 			gus_type = 0x37;
 			mixer_type = ICS2101;
-			request_region(u_MixSelect, 1, "GUS mixer");
+			if (!request_region(u_MixSelect, 1, "GUS mixer")) {
+				printk(KERN_ERR "request_region failed\n");
+				return;
+			}
 		}
 		else
 		{
@@ -3084,7 +3087,10 @@ void __init gus_wave_init(struct address
 		case ICS2101:
 			gus_mic_vol = gus_line_vol = gus_pcm_volume = 100;
 			gus_wave_volume = 90;
-			request_region(u_MixSelect, 1, "GUS mixer");
+			if (!request_region(u_MixSelect, 1, "GUS mixer")) {
+				printk(KERN_ERR "request_region failed\n");
+				return;
+			}
 			hw_config->slots[5] = ics2101_mixer_init();
 			audio_devs[gus_devnum]->mixer_dev = hw_config->slots[5];	/* Next mixer# */
 			return;

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
