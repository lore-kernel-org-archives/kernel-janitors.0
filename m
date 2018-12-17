From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 17 Dec 2018 07:05:13 +0000
Subject: [PATCH net] qed: Fix an error code qed_ll2_start_xmit()
Message-Id: <20181217070513.GD12159@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mintz@kadam, Yuval <Yuval.Mintz@cavium.com>, Ariel Elior <Ariel.Elior@cavium.com>
Cc: everest-linux-l2@cavium.com, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We accidentally deleted the code to set "rc = -ENOMEM;" and this patch
adds it back.

Fixes: d2201a21598a ("qed: No need for LL2 frags indication")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---

I'm not totally sure about this patch.  Please review it carefully.

There are four callers of this function: qedi_data_avail(), qedf_xmit(),
qedf_fcoe_send_vlan_req() and qedf_fip_send().  Only qedi_data_avail()
checks the error code, and if it sees an error it calls kfree_skb().

 drivers/net/ethernet/qlogic/qed/qed_ll2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_ll2.c b/drivers/net/ethernet/qlogic/qed/qed_ll2.c
index 504c8f71b61d..90afd514ffe1 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_ll2.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_ll2.c
@@ -2506,6 +2506,7 @@ static int qed_ll2_start_xmit(struct qed_dev *cdev, struct sk_buff *skb,
 		if (unlikely(dma_mapping_error(&cdev->pdev->dev, mapping))) {
 			DP_NOTICE(cdev,
 				  "Unable to map frag - dropping packet\n");
+			rc = -ENOMEM;
 			goto err;
 		}
 
-- 
2.17.1
