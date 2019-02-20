From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 Feb 2019 05:40:41 +0000
Subject: [PATCH] IB/iser: Fix some error handling in iser_fast_reg_fmr()
Message-Id: <20190220054041.GB25196@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The ib_sg_to_pages() function can return negative error codes.  The
problem with the error handling is that mem->dma_nents is a u32 so
the comparison is type promoted to unsigned int.  A negative error code
thus becomes a large positive value and is treated as valid.

Fixes: 57b26497fabe ("IB/iser: Pass the correct number of entries for dma mapped SGL ")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/infiniband/ulp/iser/iser_memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/ulp/iser/iser_memory.c b/drivers/infiniband/ulp/iser/iser_memory.c
index 2ba70729d7b0..04a9b8f118df 100644
--- a/drivers/infiniband/ulp/iser/iser_memory.c
+++ b/drivers/infiniband/ulp/iser/iser_memory.c
@@ -240,7 +240,7 @@ int iser_fast_reg_fmr(struct iscsi_iser_task *iser_task,
 	page_vec->fake_mr.page_size = SIZE_4K;
 	plen = ib_sg_to_pages(&page_vec->fake_mr, mem->sg,
 			      mem->dma_nents, NULL, iser_set_page);
-	if (unlikely(plen < mem->dma_nents)) {
+	if (plen < 0 || plen < mem->dma_nents) {
 		iser_err("page vec too short to hold this SG\n");
 		iser_data_buf_dump(mem, device->ib_device);
 		iser_dump_page_vec(page_vec);
-- 
2.17.1
