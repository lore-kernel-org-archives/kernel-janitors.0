From: Chuck Short <zulcss@gmail.com>
Date: Mon, 23 May 2005 22:33:17 +0000
Subject: [KJ] [PATCH] sa1100fb should use msleep
Message-Id: <42925A2D.90600@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------010708010709000309060402"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------010708010709000309060402
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Signed off by: Chuck Short <zulcss@gmail.com>



--------------010708010709000309060402
Content-Type: text/x-patch;
 name="sa1100fb-msleep.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="sa1100fb-msleep.patch"

diff -Naur linux-source-2.6.12-2.6.11.92.orig/drivers/video/sa1100fb.c linux-source-2.6.12-2.6.11.92/drivers/video/sa1100fb.c
--- linux-source-2.6.12-2.6.11.92.orig/drivers/video/sa1100fb.c	2005-04-21 06:39:57.000000000 -0400
+++ linux-source-2.6.12-2.6.11.92/drivers/video/sa1100fb.c	2005-05-18 12:38:32.031397784 -0400
@@ -1072,14 +1072,13 @@
 		GPCR |= SHANNON_GPIO_DISP_EN;
 	}	
 
-	set_current_state(TASK_UNINTERRUPTIBLE);
 	add_wait_queue(&fbi->ctrlr_wait, &wait);
 
 	LCSR = 0xffffffff;	/* Clear LCD Status Register */
 	LCCR0 &= ~LCCR0_LDM;	/* Enable LCD Disable Done Interrupt */
 	LCCR0 &= ~LCCR0_LEN;	/* Disable LCD Controller */
 
-	schedule_timeout(20 * HZ / 1000);
+	msleep(20);
 	remove_wait_queue(&fbi->ctrlr_wait, &wait);
 }
 

--------------010708010709000309060402
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------010708010709000309060402--
