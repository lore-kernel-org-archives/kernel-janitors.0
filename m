From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Sep 2017 16:18:19 +0000
Subject: [PATCH 1/2] [media] fc0012: Delete an error message for a failed memory allocation in fc0012_attach(
Message-Id: <19ac45f6-f11b-6ca3-eb9a-39999bf6e21a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8f64b84d-cca0-d618-eb62-ec12f42b8c06@users.sourceforge.net>
In-Reply-To: <8f64b84d-cca0-d618-eb62-ec12f42b8c06@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Colin Ian King <colin.king@canonical.com>, Hans Verkuil <hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Max Kellermann <max.kellermann@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Sep 2017 17:47:52 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/tuners/fc0012.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/tuners/fc0012.c b/drivers/media/tuners/fc0012.c
index 625ac6f51c39..7126dd1d5151 100644
--- a/drivers/media/tuners/fc0012.c
+++ b/drivers/media/tuners/fc0012.c
@@ -449,6 +449,5 @@ struct dvb_frontend *fc0012_attach(struct dvb_frontend *fe,
 	if (!priv) {
 		ret = -ENOMEM;
-		dev_err(&i2c->dev, "%s: kzalloc() failed\n", KBUILD_MODNAME);
 		goto err;
 	}
 
-- 
2.14.1

