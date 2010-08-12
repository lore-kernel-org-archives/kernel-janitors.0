From: Dan Carpenter <error27@gmail.com>
Date: Thu, 12 Aug 2010 07:41:58 +0000
Subject: [patch] V4L/DVB: unlock on error path
Message-Id: <20100812074158.GH645@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Pawel Osciak <p.osciak@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

If we return directly here then we miss out on some mutex_unlock()s

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/video/s5p-fimc/fimc-core.c b/drivers/media/video/s5p-fimc/fimc-core.c
index b151c7b..1beb226 100644
--- a/drivers/media/video/s5p-fimc/fimc-core.c
+++ b/drivers/media/video/s5p-fimc/fimc-core.c
@@ -822,7 +822,8 @@ static int fimc_m2m_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
 	} else {
 		v4l2_err(&ctx->fimc_dev->m2m.v4l2_dev,
 			 "Wrong buffer/video queue type (%d)\n", f->type);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto s_fmt_out;
 	}
 
 	pix = &f->fmt.pix;
