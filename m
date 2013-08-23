From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Aug 2013 09:54:44 +0000
Subject: [patch] [media] sh_vou: almost forever loop in sh_vou_try_fmt_vid_out()
Message-Id: <20130823095444.GR31293@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, Hans Verkuil <hans.verkuil@cisco.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The "i < " part of the "i < ARRAY_SIZE()" condition was missing.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/platform/sh_vou.c b/drivers/media/platform/sh_vou.c
index 7a9c5e9..41f612c 100644
--- a/drivers/media/platform/sh_vou.c
+++ b/drivers/media/platform/sh_vou.c
@@ -776,9 +776,10 @@ static int sh_vou_try_fmt_vid_out(struct file *file, void *priv,
 	v4l_bound_align_image(&pix->width, 0, VOU_MAX_IMAGE_WIDTH, 1,
 			      &pix->height, 0, VOU_MAX_IMAGE_HEIGHT, 1, 0);
 
-	for (i = 0; ARRAY_SIZE(vou_fmt); i++)
+	for (i = 0; i < ARRAY_SIZE(vou_fmt); i++) {
 		if (vou_fmt[i].pfmt = pix->pixelformat)
 			return 0;
+	}
 
 	pix->pixelformat = vou_fmt[0].pfmt;
 
