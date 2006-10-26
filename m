From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Thu, 26 Oct 2006 19:07:07 +0000
Subject: [KJ] [Patch] kmemdup() cleanup in drivers/video/
Message-Id: <1161889627.7318.9.camel@alice>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1161634468.419.1.camel@alice>
In-Reply-To: <1161634468.419.1.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi,

replace open coded kmemdup() to save some screen space,
and allow inlining/not inlining to be triggered by gcc.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.19-rc3-git1/drivers/video/aty/radeon_monitor.c.orig	2006-10-26 20:02:44.000000000 +0200
+++ linux-2.6.19-rc3-git1/drivers/video/aty/radeon_monitor.c	2006-10-26 20:03:05.000000000 +0200
@@ -104,10 +104,9 @@ static int __devinit radeon_parse_montyp
 	if (pedid = NULL)
 		return mt;
 
-	tmp = (u8 *)kmalloc(EDID_LENGTH, GFP_KERNEL);
+	tmp = kmemdup(pedid, EDID_LENGTH, GFP_KERNEL);
 	if (!tmp)
 		return mt;
-	memcpy(tmp, pedid, EDID_LENGTH);
 	*out_EDID = tmp;
 	return mt;
 }
--- linux-2.6.19-rc3-git1/drivers/video/i810/i810-i2c.c.orig	2006-10-26 20:03:36.000000000 +0200
+++ linux-2.6.19-rc3-git1/drivers/video/i810/i810-i2c.c	2006-10-26 20:03:55.000000000 +0200
@@ -162,9 +162,7 @@ int i810_probe_i2c_connector(struct fb_i
 
 		if (e != NULL) {
 			DPRINTK("i810-i2c: Getting EDID from BIOS\n");
-			edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
-			if (edid)
-				memcpy(edid, e, EDID_LENGTH);
+			edid = kmemdup(e, EDID_LENGTH, GFP_KERNEL);
 		}
 	}
 
--- linux-2.6.19-rc3-git1/drivers/video/intelfb/intelfbdrv.c.orig	2006-10-26 20:04:22.000000000 +0200
+++ linux-2.6.19-rc3-git1/drivers/video/intelfb/intelfbdrv.c	2006-10-26 20:04:47.000000000 +0200
@@ -1058,10 +1058,9 @@ intelfb_init_var(struct intelfb_info *di
 		u8 *edid_d = NULL;
 
 		if (edid_s) {
-			edid_d = kmalloc(EDID_LENGTH, GFP_KERNEL);
+			edid_d = kmemdup(edid_s, EDID_LENGTH, GFP_KERNEL);
 
 			if (edid_d) {
-				memcpy(edid_d, edid_s, EDID_LENGTH);
 				fb_edid_to_monspecs(edid_d,
 						    &dinfo->info->monspecs);
 				kfree(edid_d);
--- linux-2.6.19-rc3-git1/drivers/video/nvidia/nv_i2c.c.orig	2006-10-26 20:05:17.000000000 +0200
+++ linux-2.6.19-rc3-git1/drivers/video/nvidia/nv_i2c.c	2006-10-26 20:05:30.000000000 +0200
@@ -210,11 +210,8 @@ int nvidia_probe_i2c_connector(struct fb
 		/* try to get from firmware */
 		const u8 *e = fb_firmware_edid(info->device);
 
-		if (e != NULL) {
-			edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
-			if (edid)
-				memcpy(edid, e, EDID_LENGTH);
-		}
+		if (e != NULL)
+			edid = kmemdup(e, EDID_LENGTH, GFP_KERNEL);
 	}
 
 	*out_edid = edid;
--- linux-2.6.19-rc3-git1/drivers/video/nvidia/nv_of.c.orig	2006-10-26 20:05:55.000000000 +0200
+++ linux-2.6.19-rc3-git1/drivers/video/nvidia/nv_of.c	2006-10-26 20:06:16.000000000 +0200
@@ -72,10 +72,9 @@ int nvidia_probe_of_connector(struct fb_
 		}
 	}
 	if (pedid) {
-		*out_edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
+		*out_edid = kmemdup(pedid, EDID_LENGTH, GFP_KERNEL);
 		if (*out_edid = NULL)
 			return -1;
-		memcpy(*out_edid, pedid, EDID_LENGTH);
 		printk(KERN_DEBUG "nvidiafb: Found OF EDID for head %d\n", conn);
 		return 0;
 	}
--- linux-2.6.19-rc3-git1/drivers/video/savage/savagefb-i2c.c.orig	2006-10-26 20:06:53.000000000 +0200
+++ linux-2.6.19-rc3-git1/drivers/video/savage/savagefb-i2c.c	2006-10-26 20:07:13.000000000 +0200
@@ -227,11 +227,8 @@ int savagefb_probe_i2c_connector(struct 
 		/* try to get from firmware */
 		const u8 *e = fb_firmware_edid(info->device);
 
-		if (e) {
-			edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
-			if (edid)
-				memcpy(edid, e, EDID_LENGTH);
-		}
+		if (e)
+			edid = kmemdup(e, EDID_LENGTH, GFP_KERNEL);
 	}
 
 	*out_edid = edid;


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
