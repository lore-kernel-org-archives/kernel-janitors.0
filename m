From: Matthew Martin <lihnucks@gmail.com>
Date: Wed, 12 Jul 2006 14:20:04 +0000
Subject: [KJ] [PATCH] Convert DPRINTK to pr_debug in
Message-Id: <44B50514.7040102@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44B44D3A.8010101@gmail.com>
In-Reply-To: <44B44D3A.8010101@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello,
    This converts DPRINTK to pr_debug in drivers/video/i810/i810-i2c.c
I was wondering if I need to add a //#define DEBUG /* remove this for debugging info */ line.
I was searching lkml.org and I saw some of these kind of patches had a line like that.

Signed-off-by: Matthew Martin <lihnucks@gmail.com>
---

--- vanilla-linux-2.6.18-rc1/drivers/video/i810/i810-i2c.c	2006-07-11 15:56:03.000000000 -0500
+++ linux-2.6.18-rc1/drivers/video/i810/i810-i2c.c	2006-07-12 08:37:11.000000000 -0500
@@ -32,13 +32,6 @@
 #define SDA_VAL_OUT		0x0800
 #define SDA_VAL_IN		0x1000
 
-#define DEBUG  /* define this for verbose EDID parsing output */
-
-#ifdef DEBUG
-#define DPRINTK(fmt, args...) printk(fmt,## args)
-#else
-#define DPRINTK(fmt, args...)
-#endif
 
 static void i810i2c_setscl(void *data, int state)
 {
@@ -169,17 +162,17 @@ static u8 *i810_do_probe_i2c_edid(struct
 
         buf = kmalloc(EDID_LENGTH, GFP_KERNEL);
         if (!buf) {
-		DPRINTK("i810-i2c: Failed to allocate memory\n");
+		pr_debug("i810-i2c: Failed to allocate memory\n");
                 return NULL;
         }
         msgs[1].buf = buf;
 
         if (i2c_transfer(&chan->adapter, msgs, 2) = 2) {
-		DPRINTK("i810-i2c: I2C Transfer successful\n");
+		pr_debug("i810-i2c: I2C Transfer successful\n");
                 return buf;
 	}
 
-        DPRINTK("i810-i2c: Unable to read EDID block.\n");
+        pr_debug("i810-i2c: Unable to read EDID block.\n");
         kfree(buf);
         return NULL;
 }
@@ -190,7 +183,7 @@ int i810_probe_i2c_connector(struct fb_i
         u8 *edid = NULL;
         int i;
 
-	DPRINTK("i810-i2c: Probe DDC%i Bus\n", conn+1);
+	pr_debug("i810-i2c: Probe DDC%i Bus\n", conn+1);
 	if (conn < par->ddc_num) {
 		for (i = 0; i < 3; i++) {
 			/* Do the real work */
@@ -202,7 +195,7 @@ int i810_probe_i2c_connector(struct fb_i
 		const u8 *e = fb_firmware_edid(info->device);
 
 		if (e != NULL) {
-			DPRINTK("i810-i2c: Getting EDID from BIOS\n");
+			pr_debug("i810-i2c: Getting EDID from BIOS\n");
 			edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
 			if (edid)
 				memcpy(edid, e, EDID_LENGTH);



 



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
