From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 21:00:09 +0000
Subject: [Kernel-janitors] [PATCH] prism54/islpci_dev: replace
Message-Id: <20040727210009.GK3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============5959432724550352=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============5959432724550352==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to guarantee
the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/net/wireless/prism54/islpci_dev.c	2004-06-16 05:18:52.000000000 +0000
+++ linux-dev/drivers/net/wireless/prism54/islpci_dev.c	2004-07-03 02:40:59.000000000 +0000
@@ -308,8 +308,7 @@ prism54_bring_down(islpci_private *priv)
 	wmb();
 
 	/* wait a while for the device to reset */
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(50*HZ/1000);
+	msleep(50);
 
 	return 0;
 }

--===============5959432724550352==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============5959432724550352==--
