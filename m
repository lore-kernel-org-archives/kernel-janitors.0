From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 23:07:37 +0000
Subject: [Kernel-janitors] [PATCH] usb/pxa2xx_udc.c: replace
Message-Id: <20040727230737.GI4679@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============38484823924465195=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============38484823924465195==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to 
guarantee the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/usb/gadget/pxa2xx_udc.c	2004-06-16 05:19:37.000000000 +0000
+++ linux-dev/drivers/usb/gadget/pxa2xx_udc.c	2004-07-13 20:31:07.000000000 +0000
@@ -1508,7 +1508,7 @@ static void udc_enable (struct pxa2xx_ud
 	/* caller must be able to sleep in order to cope
 	 * with startup transients.
 	 */
-	schedule_timeout(HZ/10);
+	msleep(100);
 
 	/* enable suspend/resume and reset irqs */
 	udc_clear_mask_UDCCR(UDCCR_SRM | UDCCR_REM);

--===============38484823924465195==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============38484823924465195==--
