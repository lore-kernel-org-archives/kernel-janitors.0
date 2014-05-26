From: Benoit Taine <benoit.taine@lip6.fr>
Date: Mon, 26 May 2014 15:21:24 +0000
Subject: [PATCH 15/18] Drivers: media: Use kmemdup instead of kmalloc + memcpy
Message-Id: <1401117687-28911-16-git-send-email-benoit.taine@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401117687-28911-1-git-send-email-benoit.taine@lip6.fr>
In-Reply-To: <1401117687-28911-1-git-send-email-benoit.taine@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: benoit.taine@lip6.fr, Mauro Carvalho Chehab <m.chehab@samsung.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This issue was reported by coccicheck using the semantic patch 
at scripts/coccinelle/api/memdup.cocci

Signed-off-by: Benoit Taine <benoit.taine@lip6.fr>
---
Tested by compilation without errors.

 drivers/media/platform/soc_camera/soc_camera.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/soc_camera/soc_camera.c b/drivers/media/platform/soc_camera/soc_camera.c
index c8549bf..8646c11 100644
--- a/drivers/media/platform/soc_camera/soc_camera.c
+++ b/drivers/media/platform/soc_camera/soc_camera.c
@@ -1346,13 +1346,11 @@ static int soc_camera_i2c_init(struct soc_camera_device *icd,
 		return -ENODEV;
 	}
 
-	ssdd = kzalloc(sizeof(*ssdd), GFP_KERNEL);
+	ssdd = kmemdup(&sdesc->subdev_desc, sizeof(*ssdd), GFP_KERNEL);
 	if (!ssdd) {
 		ret = -ENOMEM;
 		goto ealloc;
 	}
-
-	memcpy(ssdd, &sdesc->subdev_desc, sizeof(*ssdd));
 	/*
 	 * In synchronous case we request regulators ourselves in
 	 * soc_camera_pdrv_probe(), make sure the subdevice driver doesn't try

