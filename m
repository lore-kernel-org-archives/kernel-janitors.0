From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 21 May 2020 12:12:21 +0000
Subject: [PATCH] scsi: cxgb3i: fix some leaks in init_act_open()
Message-Id: <20200521121221.GA247492@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karen Xie <kxie@chelsio.com>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, James Bottomley <James.Bottomley@suse.de>, Mike Christie <michaelc@cs.wisc.edu>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

There wasn't any clean up done if cxgb3_alloc_atid() failed and also the
original code didn't release "csk->l2t".

Fixes: 6f7efaabefeb ("[SCSI] cxgb3i: change cxgb3i to use libcxgbi")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From static analysis.  Not tested.

 drivers/scsi/cxgbi/cxgb3i/cxgb3i.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/cxgbi/cxgb3i/cxgb3i.c b/drivers/scsi/cxgbi/cxgb3i/cxgb3i.c
index 524cdbcd29aa..ec7d01f6e2d5 100644
--- a/drivers/scsi/cxgbi/cxgb3i/cxgb3i.c
+++ b/drivers/scsi/cxgbi/cxgb3i/cxgb3i.c
@@ -959,6 +959,7 @@ static int init_act_open(struct cxgbi_sock *csk)
 	struct net_device *ndev = cdev->ports[csk->port_id];
 	struct cxgbi_hba *chba = cdev->hbas[csk->port_id];
 	struct sk_buff *skb = NULL;
+	int ret;
 
 	log_debug(1 << CXGBI_DBG_TOE | 1 << CXGBI_DBG_SOCK,
 		"csk 0x%p,%u,0x%lx.\n", csk, csk->state, csk->flags);
@@ -979,16 +980,16 @@ static int init_act_open(struct cxgbi_sock *csk)
 	csk->atid = cxgb3_alloc_atid(t3dev, &t3_client, csk);
 	if (csk->atid < 0) {
 		pr_err("NO atid available.\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_sock;
 	}
 	cxgbi_sock_set_flag(csk, CTPF_HAS_ATID);
 	cxgbi_sock_get(csk);
 
 	skb = alloc_wr(sizeof(struct cpl_act_open_req), 0, GFP_KERNEL);
 	if (!skb) {
-		cxgb3_free_atid(t3dev, csk->atid);
-		cxgbi_sock_put(csk);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto free_atid;
 	}
 	skb->sk = (struct sock *)csk;
 	set_arp_failure_handler(skb, act_open_arp_failure);
@@ -1010,6 +1011,15 @@ static int init_act_open(struct cxgbi_sock *csk)
 	cxgbi_sock_set_state(csk, CTP_ACTIVE_OPEN);
 	send_act_open_req(csk, skb, csk->l2t);
 	return 0;
+
+free_atid:
+	cxgb3_free_atid(t3dev, csk->atid);
+put_sock:
+	cxgbi_sock_put(csk);
+	l2t_release(t3dev, csk->l2t);
+	csk->l2t = NULL;
+
+	return ret;
 }
 
 cxgb3_cpl_handler_func cxgb3i_cpl_handlers[NUM_CPL_CMDS] = {
-- 
2.26.2
