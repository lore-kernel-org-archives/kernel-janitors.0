From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 12 Oct 2016 14:50:13 +0000
Subject: [PATCH 12/34] [media] DaVinci-VPBE: Delete an unnecessary variable initialisation in vpbe_set_output
Message-Id: <24adf0d8-1221-6c1e-f468-05a26d320a74@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a99f89f2-a3be-9b5f-95c1-e0912a7d78f3@users.sourceforge.net>
In-Reply-To: <a99f89f2-a3be-9b5f-95c1-e0912a7d78f3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 12 Oct 2016 10:16:23 +0200

The local variable "ret" will be set to an appropriate value a bit later.
Thus omit the explicit initialisation at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/platform/davinci/vpbe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/davinci/vpbe.c b/drivers/media/platform/davinci/vpbe.c
index e68a792..b2c5d8f 100644
--- a/drivers/media/platform/davinci/vpbe.c
+++ b/drivers/media/platform/davinci/vpbe.c
@@ -229,7 +229,7 @@ static int vpbe_set_output(struct vpbe_device *vpbe_dev, int index)
 	struct venc_platform_data *venc_device = vpbe_dev->venc_device;
 	int enc_out_index;
 	int sd_index;
-	int ret = 0;
+	int ret;
 
 	if (index >= cfg->num_outputs)
 		return -EINVAL;
-- 
2.10.1

