From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 23 Sep 2004 22:13:03 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 17/38] net/islpci_dev: replace
Message-Id: <20040923221303.GB13244@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============85261793678869036=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============85261793678869036==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout()
to guarantee the task delays as expected. Also set_current_state() is
inserted before schedule_timeout(). If the for-loop were to execute
twice, the second time would not set the state before sleeping in the
current code; this causes schedule_timeout() to return immediately.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/wireless/prism54/islpci_dev.c	2004-09-13 17:15:41.000000000 -0700
+++ 2.6.9-rc2/drivers/net/wireless/prism54/islpci_dev.c	2004-09-23 13:58:42.000000000 -0700
@@ -436,8 +436,7 @@ prism54_bring_down(islpci_private *priv)
 	wmb();
 
 	/* wait a while for the device to reset */
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(50*HZ/1000);
+	msleep(50);
 
 	return 0;
 }
@@ -489,6 +488,7 @@ islpci_reset_if(islpci_private *priv)
 		/* The software reset acknowledge needs about 220 msec here.
 		 * Be conservative and wait for up to one second. */
 	
+		set_current_state(TASK_UNINTERRUPTIBLE);
 		remaining = schedule_timeout(HZ);
 
 		if(remaining > 0) {

--===============85261793678869036==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============85261793678869036==--
