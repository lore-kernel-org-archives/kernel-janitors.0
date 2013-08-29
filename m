From: Shaun Laing <shaun@xresource.ca>
Date: Thu, 29 Aug 2013 14:27:22 +0000
Subject: [PATCH] staging: crystalhd: Resolve sparse 'different base types' warnings.
Message-Id: <1377786442-456298-1-git-send-email-shaun@xresource.ca>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The result from crystalhd_get_sgle_paddr and crystalhd_get_sgle_len are later
used in calculations, so the result should be in CPU byte ordering.

Signed-off-by: Shaun Laing <shaun@xresource.ca>

---
Assumes sg_dma_address and sg_dma_len return values in CPU byte ordering.

 drivers/staging/crystalhd/crystalhd_misc.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/crystalhd/crystalhd_misc.h b/drivers/staging/crystalhd/crystalhd_misc.h
index 4dae3a7..aa736c8 100644
--- a/drivers/staging/crystalhd/crystalhd_misc.h
+++ b/drivers/staging/crystalhd/crystalhd_misc.h
@@ -177,8 +177,8 @@ extern enum BC_STATUS crystalhd_map_dio(struct crystalhd_adp *, void *,
 
 extern enum BC_STATUS crystalhd_unmap_dio(struct crystalhd_adp *,
 					 struct crystalhd_dio_req*);
-#define crystalhd_get_sgle_paddr(_dio, _ix) (cpu_to_le64(sg_dma_address(&_dio->sg[_ix])))
-#define crystalhd_get_sgle_len(_dio, _ix) (cpu_to_le32(sg_dma_len(&_dio->sg[_ix])))
+#define crystalhd_get_sgle_paddr(_dio, _ix) (sg_dma_address(&_dio->sg[_ix]))
+#define crystalhd_get_sgle_len(_dio, _ix) (sg_dma_len(&_dio->sg[_ix]))
 
 /*======== General Purpose Queues =========*/
 extern enum BC_STATUS crystalhd_create_dioq(struct crystalhd_adp *,
-- 
1.7.9.5

