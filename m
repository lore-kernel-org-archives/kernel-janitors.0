From: Colin King <colin.king@canonical.com>
Date: Thu, 07 Nov 2019 22:48:55 +0000
Subject: [PATCH] infiniband: ocrdma: fix spelling mistake in variable name
Message-Id: <20191107224855.417647-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the variable nak_invalid_requst_errors,
rename it to nak_invalid_request_errors.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/hw/ocrdma/ocrdma_sli.h   | 2 +-
 drivers/infiniband/hw/ocrdma/ocrdma_stats.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/infiniband/hw/ocrdma/ocrdma_sli.h b/drivers/infiniband/hw/ocrdma/ocrdma_sli.h
index 6ef89c226ad8..c2e0d0fa44be 100644
--- a/drivers/infiniband/hw/ocrdma/ocrdma_sli.h
+++ b/drivers/infiniband/hw/ocrdma/ocrdma_sli.h
@@ -2034,7 +2034,7 @@ struct ocrdma_rx_stats {
 };
 
 struct ocrdma_rx_qp_err_stats {
-	u32 nak_invalid_requst_errors;
+	u32 nak_invalid_request_errors;
 	u32 nak_remote_operation_errors;
 	u32 nak_count_remote_access_errors;
 	u32 local_length_errors;
diff --git a/drivers/infiniband/hw/ocrdma/ocrdma_stats.c b/drivers/infiniband/hw/ocrdma/ocrdma_stats.c
index a902942adb5d..94d97bbb1254 100644
--- a/drivers/infiniband/hw/ocrdma/ocrdma_stats.c
+++ b/drivers/infiniband/hw/ocrdma/ocrdma_stats.c
@@ -423,8 +423,8 @@ static char *ocrdma_rxqp_errstats(struct ocrdma_dev *dev)
 	memset(stats, 0, (OCRDMA_MAX_DBGFS_MEM));
 
 	pcur = stats;
-	pcur += ocrdma_add_stat(stats, pcur, "nak_invalid_requst_errors",
-			(u64)rx_qp_err_stats->nak_invalid_requst_errors);
+	pcur += ocrdma_add_stat(stats, pcur, "nak_invalid_request_errors",
+			(u64)rx_qp_err_stats->nak_invalid_request_errors);
 	pcur += ocrdma_add_stat(stats, pcur, "nak_remote_operation_errors",
 			(u64)rx_qp_err_stats->nak_remote_operation_errors);
 	pcur += ocrdma_add_stat(stats, pcur, "nak_count_remote_access_errors",
-- 
2.20.1
