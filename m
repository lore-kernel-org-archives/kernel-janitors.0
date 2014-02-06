From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 06 Feb 2014 12:48:23 +0000
Subject: [patch] RDMA/nes: clean up a conditon
Message-Id: <20140206124822.GB16998@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Faisal Latif <faisal.latif@intel.com>
Cc: Roland Dreier <roland@kernel.org>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

We don't need to test "ret" twice and also the white space is messed up.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/nes/nes_verbs.c b/drivers/infiniband/hw/nes/nes_verbs.c
index 8308e3634767..2db2b58f70d9 100644
--- a/drivers/infiniband/hw/nes/nes_verbs.c
+++ b/drivers/infiniband/hw/nes/nes_verbs.c
@@ -3134,9 +3134,7 @@ int nes_modify_qp(struct ib_qp *ibqp, struct ib_qp_attr *attr,
 				" original_last_aeq = 0x%04X. last_aeq = 0x%04X.\n",
 				nesqp->hwqp.qp_id, atomic_read(&nesqp->refcount),
 				original_last_aeq, nesqp->last_aeq);
-		if ((!ret) ||
-				((original_last_aeq != NES_AEQE_AEID_RDMAP_ROE_BAD_LLP_CLOSE) &&
-				(ret))) {
+		if (!ret || original_last_aeq != NES_AEQE_AEID_RDMAP_ROE_BAD_LLP_CLOSE) {
 			if (dont_wait) {
 				if (nesqp->cm_id && nesqp->hw_tcp_state != 0) {
 					nes_debug(NES_DBG_MOD_QP, "QP%u Queuing fake disconnect for QP refcount (%d),"
