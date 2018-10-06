From: Colin King <colin.king@canonical.com>
Date: Sat, 06 Oct 2018 21:56:58 +0000
Subject: [PATCH] misc: mic: scif: remove redundant check on ret < 0
Message-Id: <20181006215658.31288-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudeep Dutt <sudeep.dutt@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check for ret < 0 is redundant as any places prior to this point
where ret is set to an error value the code will exit out of the loop
to the error exit label 'err'.  Remove this redundant dead code.

Detected by CoverityScan, CID#1339528 ("Logically dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/misc/mic/scif/scif_dma.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/misc/mic/scif/scif_dma.c b/drivers/misc/mic/scif/scif_dma.c
index 03af8b5b7b0d..2d76c200d072 100644
--- a/drivers/misc/mic/scif/scif_dma.c
+++ b/drivers/misc/mic/scif/scif_dma.c
@@ -1035,8 +1035,6 @@ scif_rma_list_dma_copy_unaligned(struct scif_copy_work *work,
 			}
 			dma_async_issue_pending(chan);
 		}
-		if (ret < 0)
-			goto err;
 		offset += loop_len;
 		temp += loop_len;
 		temp_phys += loop_len;
-- 
2.17.1
