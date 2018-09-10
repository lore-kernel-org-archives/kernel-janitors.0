From: Colin King <colin.king@canonical.com>
Date: Mon, 10 Sep 2018 12:17:22 +0000
Subject: [PATCH][next] cxgb4: remove redundant assignment to vlan_cmd.dropnovlan_fm
Message-Id: <20180910121722.15524-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ganesh Goudar <ganeshgr@chelsio.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A recent commit updated vlan_cmd.dropnovlan_fm but failed to remove
the older assignment.  Fix this by removing the former redundant
assignment.

Detected by CoverityScan, CID#1473290 ("Unused value")

Fixes: a89cdd8e7c74 ("cxgb4: impose mandatory VLAN usage when non-zero TAG ID")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/t4_hw.c b/drivers/net/ethernet/chelsio/cxgb4/t4_hw.c
index 6f1bd7bf1a11..c28a1d8b7f33 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/t4_hw.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/t4_hw.c
@@ -10209,7 +10209,6 @@ int t4_set_vlan_acl(struct adapter *adap, unsigned int mbox, unsigned int vf,
 					 FW_ACL_VLAN_CMD_VFN_V(vf));
 	vlan_cmd.en_to_len16 = cpu_to_be32(enable | FW_LEN16(vlan_cmd));
 	/* Drop all packets that donot match vlan id */
-	vlan_cmd.dropnovlan_fm = FW_ACL_VLAN_CMD_FM_F;
 	vlan_cmd.dropnovlan_fm = (enable
 				  ? (FW_ACL_VLAN_CMD_DROPNOVLAN_F |
 				     FW_ACL_VLAN_CMD_FM_F) : 0);
-- 
2.17.1
