From: Colin King <colin.king@canonical.com>
Date: Fri, 08 May 2020 22:40:26 +0000
Subject: [PATCH] cnic: remove redundant assignment to variable ret
Message-Id: <20200508224026.483746-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being assigned with a value that is never read,
the assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/broadcom/cnic.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/cnic.c b/drivers/net/ethernet/broadcom/cnic.c
index 61ab7d21f6bd..c5cca63b8571 100644
--- a/drivers/net/ethernet/broadcom/cnic.c
+++ b/drivers/net/ethernet/broadcom/cnic.c
@@ -1918,7 +1918,6 @@ static int cnic_bnx2x_iscsi_ofld1(struct cnic_dev *dev, struct kwqe *wqes[],
 	ret = cnic_alloc_bnx2x_conn_resc(dev, l5_cid);
 	if (ret) {
 		atomic_dec(&cp->iscsi_conn);
-		ret = 0;
 		goto done;
 	}
 	ret = cnic_setup_bnx2x_ctx(dev, wqes, num);
-- 
2.25.1
