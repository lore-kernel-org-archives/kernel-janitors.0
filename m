From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 23 Sep 2004 22:13:09 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 18/38] net/islpci_mgt: add
Message-Id: <20040923221309.GC13244@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============82040613353868097=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============82040613353868097==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Insert set_current_state() before schedule_timeout() so the
task delays as expected. In the current code, prepare_to_wait() takes
care of this problem for the first iteration of the while-loop, but on
subsequent iterations, schedule_timeout() will return immediately.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/wireless/prism54/islpci_mgt.c	2004-09-13 17:15:41.000000000 -0700
+++ 2.6.9-rc2/drivers/net/wireless/prism54/islpci_mgt.c	2004-09-15 09:55:20.000000000 -0700
@@ -473,6 +473,7 @@ islpci_mgt_transaction(struct net_device
 		int timeleft;
 		struct islpci_mgmtframe *frame;
 
+		set_current_state(TASK_UNINTERRUPTIBLE);
 		timeleft = schedule_timeout(wait_cycle_jiffies);
 		frame = xchg(&priv->mgmt_received, NULL);
 		if (frame) {

--===============82040613353868097==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============82040613353868097==--
