From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 Jan 2020 05:35:34 +0000
Subject: [PATCH] media: hantro: remove a pointless NULL check
Message-Id: <20200108053534.6rwxk2httwoflbgv@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ezequiel Garcia <ezequiel@collabora.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org

This can't be NULL and we've already dereferenced it so let's remove
the check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/media/hantro/hantro_v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
index 85af1b96fd34..0198bcda26b7 100644
--- a/drivers/staging/media/hantro/hantro_v4l2.c
+++ b/drivers/staging/media/hantro/hantro_v4l2.c
@@ -688,7 +688,7 @@ static int hantro_start_streaming(struct vb2_queue *q, unsigned int count)
 	return ret;
 
 err_codec_exit:
-	if (ctx->codec_ops && ctx->codec_ops->exit)
+	if (ctx->codec_ops->exit)
 		ctx->codec_ops->exit(ctx);
 	return ret;
 }
-- 
2.11.0
