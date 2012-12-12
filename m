From: Cyril Roelandt <tipecaml@gmail.com>
Date: Wed, 12 Dec 2012 00:24:51 +0000
Subject: [PATCH 2/5] media: davinci: fix return value check in vpbe_display_reqbufs().
Message-Id: <1355271894-5284-3-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1355271894-5284-1-git-send-email-tipecaml@gmail.com>
In-Reply-To: <1355271894-5284-1-git-send-email-tipecaml@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, Cyril Roelandt <tipecaml@gmail.com>, manjunath.hadli@ti.com, prabhakar.lad@ti.com, mchehab@redhat.com, linux-media@vger.kernel.org, davinci-linux-open-source@linux.davincidsp.com

vb2_dma_contig_init_ctx() returns ERR_PTR and never returns NULL, so IS_ERR
should be used instead of a NULL check.

Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
---
 drivers/media/platform/davinci/vpbe_display.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/davinci/vpbe_display.c b/drivers/media/platform/davinci/vpbe_display.c
index 2bfde79..2db4eff 100644
--- a/drivers/media/platform/davinci/vpbe_display.c
+++ b/drivers/media/platform/davinci/vpbe_display.c
@@ -1393,7 +1393,7 @@ static int vpbe_display_reqbufs(struct file *file, void *priv,
 	}
 	/* Initialize videobuf queue as per the buffer type */
 	layer->alloc_ctx = vb2_dma_contig_init_ctx(vpbe_dev->pdev);
-	if (!layer->alloc_ctx) {
+	if (IS_ERR(layer->alloc_ctx)) {
 		v4l2_err(&vpbe_dev->v4l2_dev, "Failed to get the context\n");
 		return -EINVAL;
 	}
-- 
1.7.10.4

