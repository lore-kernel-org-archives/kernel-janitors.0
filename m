From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 22 Oct 2004 23:45:43 +0000
Subject: [KJ] [PATCH] video/pxafb: reorder add_wait_queue() and
Message-Id: <20041022234542.GJ18906@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============06780828715367293=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============06780828715367293==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be, as always, appreciated.

-Nish

Description: Reorder set_current_state() and add_wait_queue(). There is
a chance that a signal could be missed in between the two functions
currently.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-bk7-vanilla/drivers/video/pxafb.c	2004-10-22 10:40:44.000000000 -0700
+++ 2.6.9-bk7/drivers/video/pxafb.c	2004-10-22 15:59:23.000000000 -0700
@@ -741,8 +741,8 @@ static void pxafb_disable_controller(str
 
 	DPRINTK("Disabling LCD controller\n");
 
-	add_wait_queue(&fbi->ctrlr_wait, &wait);
 	set_current_state(TASK_UNINTERRUPTIBLE);
+	add_wait_queue(&fbi->ctrlr_wait, &wait);
 
 	LCSR = 0xffffffff;	/* Clear LCD Status Register */
 	LCCR0 &= ~LCCR0_LDM;	/* Enable LCD Disable Done Interrupt */

--===============06780828715367293==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============06780828715367293==--
