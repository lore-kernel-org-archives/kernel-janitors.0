From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 23:06:20 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 1/4] video/pxafb: replace
Message-Id: <20040927230620.GR1617@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============52665405960492451=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040920221217.GZ2270@us.ibm.com>
In-Reply-To: <20040920221217.GZ2270@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============52665405960492451==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout() to
guarantee the task delays as expected.

--- 2.6.9-rc2-vanilla/drivers/video/pxafb.c	2004-09-13 17:15:38.000000000 -0700
+++ 2.6.9-rc2/drivers/video/pxafb.c	2004-09-14 10:42:13.000000000 -0700
@@ -747,7 +747,7 @@ static void pxafb_disable_controller(str
 	LCCR0 &= ~LCCR0_LDM;	/* Enable LCD Disable Done Interrupt */
 	LCCR0 |= LCCR0_DIS;	/* Disable LCD Controller */
 
-	schedule_timeout(20 * HZ / 1000);
+	msleep(20);
 	remove_wait_queue(&fbi->ctrlr_wait, &wait);
 }
 

--===============52665405960492451==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============52665405960492451==--
