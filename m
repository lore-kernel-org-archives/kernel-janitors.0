From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Jul 2016 08:23:09 +0000
Subject: [patch -next] bnxt: fix a condition
Message-Id: <20160707082309.GC16742@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Michael Chan <michael.chan@broadcom.com>
Cc: Jeffrey Huang <huangjw@broadcom.com>, Alexander Duyck <aduyck@mirantis.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This code generates as static checker warning because htons(ETH_P_IPV6)
is always true.  From the context it looks like the && was intended to
be !=.

Fixes: 94758f8de037 ('bnxt_en: Add GRO logic for BCM5731X chips.')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 70b148a..659faa6 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -997,7 +997,7 @@ static struct sk_buff *bnxt_gro_func_5731x(struct bnxt_tpa_info *tpa_info,
 		 * correct protocol ID, it must be a loopback packet where
 		 * the offsets are off by 4.
 		 */
-		if (proto != htons(ETH_P_IP) && proto && htons(ETH_P_IPV6))
+		if (proto != htons(ETH_P_IP) && proto != htons(ETH_P_IPV6))
 			loopback = true;
 	}
 	if (loopback) {
