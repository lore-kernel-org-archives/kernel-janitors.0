From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Tue, 29 Sep 2020 13:14:31 +0000
Subject: [PATCH 08/20] media: sun4i-csi: use semicolons rather than commas to separate statements
Message-Id: <1601385283-26144-9-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxime Ripard <mripard@kernel.org>
Cc: =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org

Replace commas with semicolons.  Commas introduce unnecessary
variability in the code structure and are hard to see.  What is done
is essentially described by the following Coccinelle semantic patch
(http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
index 8f4e254b6a41..1a2f65d83a6c 100644
--- a/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
+++ b/drivers/media/platform/sunxi/sun4i-csi/sun4i_v4l2.c
@@ -363,7 +363,7 @@ int sun4i_csi_v4l2_register(struct sun4i_csi *csi)
 	vdev->lock = &csi->lock;
 
 	/* Set a default format */
-	csi->fmt.pixelformat = sun4i_csi_formats[0].fourcc,
+	csi->fmt.pixelformat = sun4i_csi_formats[0].fourcc;
 	csi->fmt.width = CSI_DEFAULT_WIDTH;
 	csi->fmt.height = CSI_DEFAULT_HEIGHT;
 	_sun4i_csi_try_fmt(csi, &csi->fmt);
