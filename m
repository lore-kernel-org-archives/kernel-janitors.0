From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 12 Oct 2016 14:56:39 +0000
Subject: [PATCH 18/34] [media] DaVinci-VPFE-Capture: Combine substrings for an error message in vpfe_enum_inp
Message-Id: <b7c95ade-7001-809d-eb2c-62f488a11f0b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a99f89f2-a3be-9b5f-95c1-e0912a7d78f3@users.sourceforge.net>
In-Reply-To: <a99f89f2-a3be-9b5f-95c1-e0912a7d78f3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 12 Oct 2016 10:40:10 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: quoted string split across lines

Thus fix an affected source code place.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/platform/davinci/vpfe_capture.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/davinci/vpfe_capture.c b/drivers/media/platform/davinci/vpfe_capture.c
index 87ee35d..ee7b3e3 100644
--- a/drivers/media/platform/davinci/vpfe_capture.c
+++ b/drivers/media/platform/davinci/vpfe_capture.c
@@ -1086,8 +1086,8 @@ static int vpfe_enum_input(struct file *file, void *priv,
 					&subdev,
 					&index,
 					inp->index) < 0) {
-		v4l2_err(&vpfe_dev->v4l2_dev, "input information not found"
-			 " for the subdev\n");
+		v4l2_err(&vpfe_dev->v4l2_dev,
+			 "input information not found for the subdev\n");
 		return -EINVAL;
 	}
 	sdinfo = &vpfe_dev->cfg->sub_devs[subdev];
-- 
2.10.1

