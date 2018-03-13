From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 13 Mar 2018 09:09:38 +0000
Subject: [PATCH net] qed: Use after free in qed_rdma_free()
Message-Id: <20180313090938.GA17609@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ariel Elior <Ariel.Elior@cavium.com>, Michal Kalderon <Michal.Kalderon@cavium.com>
Cc: everest-linux-l2@cavium.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We're dereferencing "p_hwfn->p_rdma_info" but that is freed on the line
before in qed_rdma_resc_free(p_hwfn).

Fixes: 9de506a547c0 ("qed: Free RoCE ILT Memory on rmmod qedr")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/qlogic/qed/qed_rdma.c b/drivers/net/ethernet/qlogic/qed/qed_rdma.c
index f3ee6538b553..a411f9c702a1 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_rdma.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_rdma.c
@@ -379,8 +379,8 @@ static void qed_rdma_free(struct qed_hwfn *p_hwfn)
 	DP_VERBOSE(p_hwfn, QED_MSG_RDMA, "Freeing RDMA\n");
 
 	qed_rdma_free_reserved_lkey(p_hwfn);
-	qed_rdma_resc_free(p_hwfn);
 	qed_cxt_free_proto_ilt(p_hwfn, p_hwfn->p_rdma_info->proto);
+	qed_rdma_resc_free(p_hwfn);
 }
 
 static void qed_rdma_get_guid(struct qed_hwfn *p_hwfn, u8 *guid)
