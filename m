From: Hashem Masoud <masoudh@batelco.com.bh>
Date: Thu, 28 Sep 2006 10:35:14 +0000
Subject: [KJ] [PATCH] check return code for request_region() in gus_wave.c
Message-Id: <20060928103514.GA12240@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This is an attempt to handle return code of request_region() in 2 places 
in gus_wave.c

Tested by compiling using the option: make dir/ (is this OK?).

Signed-off-by: Hashem Masoud <masoudh@batelco.com.bh>

--- linux/sound/oss/gus_wave.c	2006-09-28 07:23:02.730614592 -0300
+++ linux-2.6.17.13/sound/oss/gus_wave.c	2006-09-27 19:03:42.000000000 -0300
@@ -2938,8 +2938,7 @@ void __init gus_wave_init(struct address
 			model_num = "3.7";
 			gus_type = 0x37;
 			mixer_type = ICS2101;
-			if (!request_region(u_MixSelect, 1, "GUS mixer"))
-				return;
+			request_region(u_MixSelect, 1, "GUS mixer");
 		}
 		else
 		{
@@ -3030,7 +3029,7 @@ void __init gus_wave_init(struct address
 	samples = (struct patch_info *)vmalloc((MAX_SAMPLE + 1) * sizeof(*samples));
 	if (samples = NULL)
 	{
-		printk(KERN_WARNING "gus_init: Cannot allocate memory for instrument tables\n");
+		printk(KERN_WARNING "gus_init: Cant allocate memory for instrument tables\n");
 		return;
 	}
 	conf_printf(tmp, hw_config);
@@ -3085,8 +3084,7 @@ void __init gus_wave_init(struct address
 		case ICS2101:
 			gus_mic_vol = gus_line_vol = gus_pcm_volume = 100;
 			gus_wave_volume = 90;
-			if (!request_region(u_MixSelect, 1, "GUS mixer"))
-				return;
+			request_region(u_MixSelect, 1, "GUS mixer");
 			hw_config->slots[5] = ics2101_mixer_init();
 			audio_devs[gus_devnum]->mixer_dev = hw_config->slots[5];	/* Next mixer# */
 			return;

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
