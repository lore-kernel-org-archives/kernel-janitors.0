From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 22 Dec 2018 07:42:59 +0000
Subject: [PATCH] IB/uverbs: Signedness bug in UVERBS_HANDLER()
Message-Id: <20181222074259.GA6338@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The "num_sge" variable needs to be signed for the error handling to
work.  The uverbs_attr_ptr_get_array_size() returns int so this change
is safe.

Fixes: ad8a4496757f ("IB/uverbs: Add support to advise_mr")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/infiniband/core/uverbs_std_types_mr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/core/uverbs_std_types_mr.c b/drivers/infiniband/core/uverbs_std_types_mr.c
index 71dfa5e5938e..4d4be0c2b752 100644
--- a/drivers/infiniband/core/uverbs_std_types_mr.c
+++ b/drivers/infiniband/core/uverbs_std_types_mr.c
@@ -47,7 +47,7 @@ static int UVERBS_HANDLER(UVERBS_METHOD_ADVISE_MR)(
 	enum ib_uverbs_advise_mr_advice advice;
 	struct ib_device *ib_dev = pd->device;
 	struct ib_sge *sg_list;
-	u32 num_sge;
+	int num_sge;
 	u32 flags;
 	int ret;
 
-- 
2.17.1
