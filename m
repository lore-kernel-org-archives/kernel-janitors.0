From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 02 Sep 2017 15:48:37 +0000
Subject: [PATCH 1/7] [media] ov2640: Delete an error message for a failed memory allocation in ov2640_probe()
Message-Id: <86121882-9d88-0609-1506-a0c785d405fd@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c9f2ba21-c742-e1e8-26d9-a56c51c56d65@users.sourceforge.net>
In-Reply-To: <c9f2ba21-c742-e1e8-26d9-a56c51c56d65@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>, =?UTF-8?Q?Frank_Sch=c3=a4fer?= <fschaefer.oss@googlemail.com>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, Hans Verkuil <hans.verkuil@cisco.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 2 Sep 2017 16:07:31 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/i2c/ov2640.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov2640.c b/drivers/media/i2c/ov2640.c
index e6d0c1f64f0b..e4ae53410097 100644
--- a/drivers/media/i2c/ov2640.c
+++ b/drivers/media/i2c/ov2640.c
@@ -1101,8 +1101,5 @@ static int ov2640_probe(struct i2c_client *client,
-	if (!priv) {
-		dev_err(&adapter->dev,
-			"Failed to allocate memory for private data!\n");
+	if (!priv)
 		return -ENOMEM;
-	}
 
 	if (client->dev.of_node) {
 		priv->clk = devm_clk_get(&client->dev, "xvclk");
-- 
2.14.1

