From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 17 Jan 2005 18:24:11 +0000
Subject: [KJ] [PATCH 2/22] atm/he: reorder add_wait_queue() and
Message-Id: <20050117182411.GB24698@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============27161903704131696=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============27161903704131696==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Reorder set_current_state() and add_wait_queue() so that no events
are missed.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/drivers/atm/he.c	2005-01-15 16:55:43.000000000 -0800
+++ 2.6.11-rc1-kj/drivers/atm/he.c	2005-01-15 17:31:30.000000000 -0800
@@ -2573,8 +2573,8 @@ he_close(struct atm_vcc *vcc)
 			udelay(250);
 		}
 
-		add_wait_queue(&he_vcc->rx_waitq, &wait);
 		set_current_state(TASK_UNINTERRUPTIBLE);
+		add_wait_queue(&he_vcc->rx_waitq, &wait);
 
 		he_writel_rsr0(he_dev, RSR0_CLOSE_CONN, cid);
 		(void) he_readl_rsr0(he_dev, cid);		/* flush posted writes */
@@ -2648,8 +2648,8 @@ he_close(struct atm_vcc *vcc)
 		tpd->vcc = vcc;
 		wmb();
 
-		add_wait_queue(&he_vcc->tx_waitq, &wait);
 		set_current_state(TASK_UNINTERRUPTIBLE);
+		add_wait_queue(&he_vcc->tx_waitq, &wait);
 		__enqueue_tpd(he_dev, tpd, cid);
 		spin_unlock_irqrestore(&he_dev->global_lock, flags);
 

--===============27161903704131696==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============27161903704131696==--
