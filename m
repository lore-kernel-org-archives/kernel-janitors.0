From: Colin King <colin.king@canonical.com>
Date: Tue, 12 Feb 2019 16:01:53 +0000
Subject: [PATCH] qed: fix indentation issue with statements in an if-block
Message-Id: <20190212160153.12432-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <aelior@marvell.com>, GR-everest-linux-l2@marvell.com, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are some statements in an if-block that are not correctly
indented. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/qlogic/qed/qed_cxt.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/qlogic/qed/qed_cxt.c b/drivers/net/ethernet/qlogic/qed/qed_cxt.c
index 35c9f484eb9f..e61d1d905415 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_cxt.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_cxt.c
@@ -2135,12 +2135,12 @@ int qed_cxt_set_pf_params(struct qed_hwfn *p_hwfn, u32 rdma_tasks)
 		struct qed_eth_pf_params *p_params  		    &p_hwfn->pf_params.eth_pf_params;
 
-			if (!p_params->num_vf_cons)
-				p_params->num_vf_cons -				    ETH_PF_PARAMS_VF_CONS_DEFAULT;
-			qed_cxt_set_proto_cid_count(p_hwfn, PROTOCOLID_ETH,
-						    p_params->num_cons,
-						    p_params->num_vf_cons);
+		if (!p_params->num_vf_cons)
+			p_params->num_vf_cons +			    ETH_PF_PARAMS_VF_CONS_DEFAULT;
+		qed_cxt_set_proto_cid_count(p_hwfn, PROTOCOLID_ETH,
+					    p_params->num_cons,
+					    p_params->num_vf_cons);
 		p_hwfn->p_cxt_mngr->arfs_count = p_params->num_arfs_filters;
 		break;
 	}
-- 
2.20.1
