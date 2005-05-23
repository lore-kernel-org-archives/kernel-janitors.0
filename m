From: Chuck Short <zulcss@gmail.com>
Date: Mon, 23 May 2005 22:30:25 +0000
Subject: [KJ] [PATCH] - pxafb should use msleep
Message-Id: <42925981.7020501@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------080206000306070000090905"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------080206000306070000090905
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

This patch changes pxafb to use msleep.

Signed-of-by: Chuck Short <zulcss@gmail.com>


--------------080206000306070000090905
Content-Type: text/x-patch;
 name="pxafb-msleep.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="pxafb-msleep.patch"

diff -Naur linux-source-2.6.12-2.6.11.92.orig/drivers/video/pxafb.c linux-source-2.6.12-2.6.11.92/drivers/video/pxafb.c
--- linux-source-2.6.12-2.6.11.92.orig/drivers/video/pxafb.c	2005-04-21 06:39:57.000000000 -0400
+++ linux-source-2.6.12-2.6.11.92/drivers/video/pxafb.c	2005-05-18 12:39:56.942489336 -0400
@@ -740,14 +740,13 @@
 
 	DPRINTK("Disabling LCD controller\n");
 
-	set_current_state(TASK_UNINTERRUPTIBLE);
 	add_wait_queue(&fbi->ctrlr_wait, &wait);
 
 	LCSR = 0xffffffff;	/* Clear LCD Status Register */
 	LCCR0 &= ~LCCR0_LDM;	/* Enable LCD Disable Done Interrupt */
 	LCCR0 |= LCCR0_DIS;	/* Disable LCD Controller */
 
-	schedule_timeout(20 * HZ / 1000);
+	msleep(20);
 	remove_wait_queue(&fbi->ctrlr_wait, &wait);
 }
 


--------------080206000306070000090905
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------080206000306070000090905--
