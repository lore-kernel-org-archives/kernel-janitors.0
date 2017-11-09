From: Colin King <colin.king@canonical.com>
Date: Thu, 09 Nov 2017 07:52:15 +0000
Subject: [PATCH] qlge: remove duplicated assignment to mbcp
Message-Id: <20171109075215.2666-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harish Patil <harish.patil@cavium.com>, Manish Chopra <manish.chopra@cavium.com>, Dept-GELinuxNICDev@cavium.com, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The assignment to mbcp is identical to the initiatialized value assigned
to mbcp at declaration time a few lines earlier, hence we can remove the
second redundant assignment.  Cleans up clang warning:

drivers/net/ethernet/qlogic/qlge/qlge_mpi.c:209:22: warning:
Value stored to 'mbcp' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/qlogic/qlge/qlge_mpi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/qlogic/qlge/qlge_mpi.c b/drivers/net/ethernet/qlogic/qlge/qlge_mpi.c
index 384c8bc874f3..4be65d6761b3 100644
--- a/drivers/net/ethernet/qlogic/qlge/qlge_mpi.c
+++ b/drivers/net/ethernet/qlogic/qlge/qlge_mpi.c
@@ -213,7 +213,6 @@ static int ql_idc_req_aen(struct ql_adapter *qdev)
 	/* Get the status data and start up a thread to
 	 * handle the request.
 	 */
-	mbcp = &qdev->idc_mbc;
 	mbcp->out_count = 4;
 	status = ql_get_mb_sts(qdev, mbcp);
 	if (status) {
-- 
2.14.1

