From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Jun 2016 20:50:29 +0000
Subject: [patch] qlcnic: use the correct ring in qlcnic_83xx_process_rcv_ring_diag()
Message-Id: <20160627205029.GA22095@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dept-GELinuxNICDev@qlogic.com, Sony Chacko <sony.chacko@qlogic.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a static checker warning here "warn: mask and shift to zero"
and the code sets "ring" to zero every time.  From looking at how
QLCNIC_FETCH_RING_ID() is used in qlcnic_83xx_process_rcv_ring() the
qlcnic_83xx_hndl() should be removed.

Fixes: 4be41e92f7c6 ('qlcnic: 83xx data path routines')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not tested.

diff --git a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c
index 7bd6f25..607bb7d 100644
--- a/drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c
+++ b/drivers/net/ethernet/qlogic/qlcnic/qlcnic_io.c
@@ -2220,7 +2220,7 @@ void qlcnic_83xx_process_rcv_ring_diag(struct qlcnic_host_sds_ring *sds_ring)
 	if (!opcode)
 		return;
 
-	ring = QLCNIC_FETCH_RING_ID(qlcnic_83xx_hndl(sts_data[0]));
+	ring = QLCNIC_FETCH_RING_ID(sts_data[0]);
 	qlcnic_83xx_process_rcv_diag(adapter, ring, sts_data);
 	desc = &sds_ring->desc_head[consumer];
 	desc->status_desc_data[0] = cpu_to_le64(STATUS_OWNER_PHANTOM);
