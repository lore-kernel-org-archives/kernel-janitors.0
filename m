From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 29 Nov 2018 01:36:42 +0000
Subject: [PATCH -next] RDMA/uverbs: Use PTR_ERR_OR_ZERO in ib_uverbs_create_cq()
Message-Id: <1543455402-79511-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/infiniband/core/uverbs_cmd.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/infiniband/core/uverbs_cmd.c b/drivers/infiniband/core/uverbs_cmd.c
index 8ee9e94..0d31cee 100644
--- a/drivers/infiniband/core/uverbs_cmd.c
+++ b/drivers/infiniband/core/uverbs_cmd.c
@@ -1051,10 +1051,7 @@ static int ib_uverbs_create_cq(struct uverbs_attr_bundle *attrs,
 				sizeof(cmd.comp_channel),
 			ib_uverbs_create_cq_cb, NULL);
 
-	if (IS_ERR(obj))
-		return PTR_ERR(obj);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(obj);
 }
 
 static int ib_uverbs_ex_create_cq_cb(struct uverbs_attr_bundle *attrs,
