From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 May 2018 12:33:36 +0000
Subject: [PATCH] net/ncsi: prevent a couple array underflows
Message-Id: <20180517123336.GB7655@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Samuel Mendoza-Jonas <sam@mendozajonas.com>
Cc: netdev@vger.kernel.org, Gavin Shan <gwshan@linux.vnet.ibm.com>, kernel-janitors@vger.kernel.org

We recently refactored this code and introduced a static checker
warning.  Smatch complains that if cmd->index is zero then we would
underflow the arrays.  That's obviously true.

The question is whether we prevent cmd->index from being zero at a
different level.  I've looked at the code and I don't immediately see
a check for that.

Fixes: 062b3e1b6d4f ("net/ncsi: Refactor MAC, VLAN filters")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index ce9497966ebe..a6b7c7d5c829 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -347,7 +347,7 @@ static int ncsi_rsp_handler_svf(struct ncsi_request *nr)
 
 	cmd = (struct ncsi_cmd_svf_pkt *)skb_network_header(nr->cmd);
 	ncf = &nc->vlan_filter;
-	if (cmd->index > ncf->n_vids)
+	if (cmd->index = 0 || cmd->index > ncf->n_vids)
 		return -ERANGE;
 
 	/* Add or remove the VLAN filter. Remember HW indexes from 1 */
@@ -445,7 +445,8 @@ static int ncsi_rsp_handler_sma(struct ncsi_request *nr)
 	ncf = &nc->mac_filter;
 	bitmap = &ncf->bitmap;
 
-	if (cmd->index > ncf->n_uc + ncf->n_mc + ncf->n_mixed)
+	if (cmd->index = 0 ||
+	    cmd->index > ncf->n_uc + ncf->n_mc + ncf->n_mixed)
 		return -ERANGE;
 
 	index = (cmd->index - 1) * ETH_ALEN;
