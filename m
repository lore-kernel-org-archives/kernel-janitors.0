From: Colin King <colin.king@canonical.com>
Date: Thu, 23 Mar 2017 11:57:46 +0000
Subject: [PATCH] [media] coda: remove redundant call to v4l2_m2m_get_vq
Message-Id: <20170323115746.18474-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The call to v4ls_m2m_get_vq is only used to get the return value
which is not being used, so it appears to be redundant and can
be removed.

Detected with CoverityScan, CID#1420674 ("Useless call")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/platform/coda/coda-common.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 800d2477f1a0..95e4648f18e6 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -817,8 +817,6 @@ static int coda_qbuf(struct file *file, void *priv,
 static bool coda_buf_is_end_of_stream(struct coda_ctx *ctx,
 				      struct vb2_v4l2_buffer *buf)
 {
-	v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT);
-
 	return ((ctx->bit_stream_param & CODA_BIT_STREAM_END_FLAG) &&
 		(buf->sequence = (ctx->qsequence - 1)));
 }
-- 
2.11.0

