From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 08 Jun 2019 09:27:14 +0000
Subject: [PATCH] RDMA/hns: Fix an error code in hns_roce_set_user_sq_size()
Message-Id: <20190608092714.GE28890@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181217070815.GF12159@kadam>
In-Reply-To: <20181217070815.GF12159@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This function is supposed to return negative kernel error codes but here
it returns CMD_RST_PRC_EBUSY (2).  The error code eventually gets passed
to IS_ERR() and since it's not an error pointer it leads to an Oops in
hns_roce_v1_rsv_lp_qp()

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static analysis.  Not tested.

 drivers/infiniband/hw/hns/hns_roce_hw_v2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/hw/hns/hns_roce_hw_v2.c b/drivers/infiniband/hw/hns/hns_roce_hw_v2.c
index ac017c24b200..018ff302ab9e 100644
--- a/drivers/infiniband/hw/hns/hns_roce_hw_v2.c
+++ b/drivers/infiniband/hw/hns/hns_roce_hw_v2.c
@@ -1098,7 +1098,7 @@ static int hns_roce_cmq_send(struct hns_roce_dev *hr_dev,
 	if (ret = CMD_RST_PRC_SUCCESS)
 		return 0;
 	if (ret = CMD_RST_PRC_EBUSY)
-		return ret;
+		return -EBUSY;
 
 	ret = __hns_roce_cmq_send(hr_dev, desc, num);
 	if (ret) {
@@ -1106,7 +1106,7 @@ static int hns_roce_cmq_send(struct hns_roce_dev *hr_dev,
 		if (retval = CMD_RST_PRC_SUCCESS)
 			return 0;
 		else if (retval = CMD_RST_PRC_EBUSY)
-			return retval;
+			return -EBUSY;
 	}
 
 	return ret;
-- 
2.20.1
