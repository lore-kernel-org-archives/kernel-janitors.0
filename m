From: Colin King <colin.king@canonical.com>
Date: Mon, 20 Nov 2017 16:11:22 +0000
Subject: [PATCH] misc/mic/scif: remove redundant assignment of dst_local to itself
Message-Id: <20171120161122.5295-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The assignment of dst_local to itself is redundant and can be removed.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/misc/mic/scif/scif_dma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/misc/mic/scif/scif_dma.c b/drivers/misc/mic/scif/scif_dma.c
index 63d6246d6dff..1c42f09eccdf 100644
--- a/drivers/misc/mic/scif/scif_dma.c
+++ b/drivers/misc/mic/scif/scif_dma.c
@@ -1571,7 +1571,6 @@ static int scif_rma_list_dma_copy_wrapper(struct scif_endpt *epd,
 	src_local = work->src_window->type = SCIF_WINDOW_SELF;
 	dst_local = work->dst_window->type = SCIF_WINDOW_SELF;
 
-	dst_local = dst_local;
 	/* Allocate dma_completion cb */
 	comp_cb = kzalloc(sizeof(*comp_cb), GFP_KERNEL);
 	if (!comp_cb)
-- 
2.14.1

