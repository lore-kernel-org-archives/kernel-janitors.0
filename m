From: James Nelson <james4765@cwazy.co.uk>
Date: Wed, 26 Jan 2005 21:27:04 +0000
Subject: [KJ] [PATCH 19/53][RESEND] cyberfb: Clean up printk()'s in
Message-Id: <20050126212659.14055.47692.81385@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============17322603311010631=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============17322603311010631==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/cyberfb.c - resent after fixing the driver name in one printk.

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/cyberfb.c linux-2.6.11-rc2-mm1/drivers/video/cyberfb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/cyberfb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/cyberfb.c	2005-01-26 16:19:32.555776095 -0500
@@ -1061,7 +1061,7 @@
 		    return -EINVAL;
 	    }
 
-	    printk("fb%d: %s frame buffer device, using %ldK of video memory\n",
+	    pr_info("fb%d: %s frame buffer device, using %ldK of video memory\n",
 		   fb_info.node, fb_info.modename, CyberSize>>10);
 
 	    /* TODO: This driver cannot be unloaded yet */
@@ -1432,7 +1432,7 @@
 
 	DPRINTK("ENTER\n");
 	if (freq < 12500000 || freq > MAXPIXELCLOCK) {
-		printk("CV64 driver: Illegal clock frequency %ld, using 25MHz\n",
+		printk(KERN_WARNING "cyberfb: Illegal clock frequency %ld, using 25MHz\n",
 		       freq);
 		freq = 25000000;
 	}

--===============17322603311010631==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============17322603311010631==--
