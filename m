From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 02 Sep 2017 15:50:16 +0000
Subject: [PATCH 3/7] [media] ov6650: Delete an error message for a failed memory allocation in ov6650_probe()
Message-Id: <32edb708-92f9-c51b-d424-aa975ca49b92@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c9f2ba21-c742-e1e8-26d9-a56c51c56d65@users.sourceforge.net>
In-Reply-To: <c9f2ba21-c742-e1e8-26d9-a56c51c56d65@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>, =?UTF-8?Q?Frank_Sch=c3=a4fer?= <fschaefer.oss@googlemail.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Hans Verkuil <hans.verkuil@cisco.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 2 Sep 2017 16:16:39 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/i2c/ov6650.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index 768f2950ea36..8975d16b2b24 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -954,8 +954,5 @@ static int ov6650_probe(struct i2c_client *client,
-	if (!priv) {
-		dev_err(&client->dev,
-			"Failed to allocate memory for private data!\n");
+	if (!priv)
 		return -ENOMEM;
-	}
 
 	v4l2_i2c_subdev_init(&priv->subdev, client, &ov6650_subdev_ops);
 	v4l2_ctrl_handler_init(&priv->hdl, 13);
-- 
2.14.1

