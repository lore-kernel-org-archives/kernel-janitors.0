From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Mar 2012 18:53:26 +0000
Subject: [patch] [SCSI] fcoe: remove a stray unlock
Message-Id: <20120329185326.GD21812@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Love <robert.w.love@intel.com>, Neil Horman <nhorman@tuxdriver.com>
Cc: "James E.J. Bottomley" <JBottomley@parallels.com>, devel@open-fcoe.org, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, Vasu Dev <vasu.dev@intel.com>

We moved the locking in dd060e74fb "[SCSI] fcoe: remove frame dropping
code from fcoe_percpu_clean" but this unlock was missed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/fcoe/fcoe.c b/drivers/scsi/fcoe/fcoe.c
index 335e851..c2d8a8c 100644
--- a/drivers/scsi/fcoe/fcoe.c
+++ b/drivers/scsi/fcoe/fcoe.c
@@ -2274,10 +2274,9 @@ static void fcoe_percpu_clean(struct fc_lport *lport)
 			continue;
 
 		skb = dev_alloc_skb(0);
-		if (!skb) {
-			spin_unlock_bh(&pp->fcoe_rx_list.lock);
+		if (!skb)
 			continue;
-		}
+
 		skb->destructor = fcoe_percpu_flush_done;
 
 		spin_lock_bh(&pp->fcoe_rx_list.lock);
