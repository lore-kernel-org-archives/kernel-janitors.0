From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 22 Oct 2004 23:56:34 +0000
Subject: [KJ] [PATCH] video/sa1100fb: reorder set_current_state() and
Message-Id: <20041022235634.GM18906@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============18297971497132837=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============18297971497132837==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be, as always, appreciated.

-Nish

Description: Reorder add_wait_queue() and set_current_state() as a
signal could be lost in between the two functions.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-bk7-vanilla/drivers/video/sa1100fb.c	2004-10-22 10:40:44.000000000 -0700
+++ 2.6.9-bk7/drivers/video/sa1100fb.c	2004-10-22 15:59:35.000000000 -0700
@@ -1342,8 +1342,8 @@ static void sa1100fb_disable_controller(
 		GPCR |= SHANNON_GPIO_DISP_EN;
 	}	
 
-	add_wait_queue(&fbi->ctrlr_wait, &wait);
 	set_current_state(TASK_UNINTERRUPTIBLE);
+	add_wait_queue(&fbi->ctrlr_wait, &wait);
 
 	LCSR = 0xffffffff;	/* Clear LCD Status Register */
 	LCCR0 &= ~LCCR0_LDM;	/* Enable LCD Disable Done Interrupt */

--===============18297971497132837==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============18297971497132837==--
