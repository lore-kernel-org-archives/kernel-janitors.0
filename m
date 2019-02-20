From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 20 Feb 2019 12:56:14 +0000
Subject: [PATCH -next] mptfusion: remove set but not used variable 'req_idx, frameOffset'
Message-Id: <20190220125614.47474-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/message/fusion/mptspi.c: In function 'mptspi_writeIOCPage4':
drivers/message/fusion/mptspi.c:262:9: warning:
 variable 'frameOffset' set but not used [-Wunused-but-set-variable]

drivers/message/fusion/mptspi.c:261:9: warning:
 variable 'req_idx' set but not used [-Wunused-but-set-variable]

They're never used and can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/message/fusion/mptspi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/message/fusion/mptspi.c b/drivers/message/fusion/mptspi.c
index 7172b0b16bdd..eabc4de5816c 100644
--- a/drivers/message/fusion/mptspi.c
+++ b/drivers/message/fusion/mptspi.c
@@ -258,8 +258,6 @@ mptspi_writeIOCPage4(MPT_SCSI_HOST *hd, u8 channel , u8 id)
 	IOCPage4_t		*IOCPage4Ptr;
 	MPT_FRAME_HDR		*mf;
 	dma_addr_t		 dataDma;
-	u16			 req_idx;
-	u32			 frameOffset;
 	u32			 flagsLength;
 	int			 ii;
 
@@ -276,9 +274,6 @@ mptspi_writeIOCPage4(MPT_SCSI_HOST *hd, u8 channel , u8 id)
 	 */
 	pReq = (Config_t *)mf;
 
-	req_idx = le16_to_cpu(mf->u.frame.hwhdr.msgctxu.fld.req_idx);
-	frameOffset = ioc->req_sz - sizeof(IOCPage4_t);
-
 	/* Complete the request frame (same for all requests).
 	 */
 	pReq->Action = MPI_CONFIG_ACTION_PAGE_WRITE_CURRENT;
