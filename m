From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Aug 2016 05:27:56 +0000
Subject: [patch] fcoe: use kfree_skb() to free an skb
Message-Id: <20160804052756.GH775@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Thumshirn <jth@kernel.org>, Hannes Reinecke <hare@suse.de>
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, fcoe-devel@open-fcoe.org, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

This should be doing kfree_skb() instead of kfree().

Fixes: 9a6cf881df02 ('fcoe: implement FIP VLAN responder')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/fcoe/fcoe_ctlr.c b/drivers/scsi/fcoe/fcoe_ctlr.c
index a569c65..dcf3653 100644
--- a/drivers/scsi/fcoe/fcoe_ctlr.c
+++ b/drivers/scsi/fcoe/fcoe_ctlr.c
@@ -2923,7 +2923,7 @@ static int fcoe_ctlr_vlan_recv(struct fcoe_ctlr *fip, struct sk_buff *skb)
 	mutex_unlock(&fip->ctlr_mutex);
 
 drop:
-	kfree(skb);
+	kfree_skb(skb);
 	return rc;
 }
 
