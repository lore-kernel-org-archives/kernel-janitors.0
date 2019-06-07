From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 07 Jun 2019 13:56:09 +0000
Subject: [PATCH] media: rockchip/vpu: remove an unnecessary NULL check
Message-Id: <20190607135609.GA16718@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Boris Brezillon <boris.brezillon@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Ezequiel Garcia <ezequiel@collabora.com>, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, kernel-janitors@vger.kernel.org

Thus the address of "&ctx->dev->variant->codec_ops[codec_mode]"
can't possibly be NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c b/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c
index 1b80a45df8fe..42f4eb0abc8a 100644
--- a/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c
+++ b/drivers/staging/media/rockchip/vpu/rockchip_vpu_v4l2.c
@@ -619,7 +619,7 @@ static int rockchip_vpu_start_streaming(struct vb2_queue *q,
 
 		vpu_debug(4, "Codec mode = %d\n", codec_mode);
 		ctx->codec_ops = &ctx->dev->variant->codec_ops[codec_mode];
-		if (ctx->codec_ops && ctx->codec_ops->init)
+		if (ctx->codec_ops->init)
 			ret = ctx->codec_ops->init(ctx);
 	}
 
-- 
2.20.1
