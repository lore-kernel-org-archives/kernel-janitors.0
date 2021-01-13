From: Colin King <colin.king@canonical.com>
Date: Wed, 13 Jan 2021 10:05:17 +0000
Subject: [PATCH][next] media: i2c: fix spelling mistakes: "enpoint" -> "endpoint"
Message-Id: <20210113100517.10959-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, =?UTF-8?q?K=C3=A9vin=20L=27h=C3=B4pital?= <kevin.lhopital@bootlin.com>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two spelling mistakes in dev_err messages. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/i2c/ov5648.c | 2 +-
 drivers/media/i2c/ov8865.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
index 609aa67b54ce..46ad0a539853 100644
--- a/drivers/media/i2c/ov5648.c
+++ b/drivers/media/i2c/ov5648.c
@@ -2453,7 +2453,7 @@ static int ov5648_probe(struct i2c_client *client)
 
 	handle = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
 	if (!handle) {
-		dev_err(dev, "unable to find enpoint node\n");
+		dev_err(dev, "unable to find endpoint node\n");
 		return -EINVAL;
 	}
 
diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index fda5a55979aa..fd5be8ef079c 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2799,7 +2799,7 @@ static int ov8865_probe(struct i2c_client *client)
 
 	handle = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
 	if (!handle) {
-		dev_err(dev, "unable to find enpoint node\n");
+		dev_err(dev, "unable to find endpoint node\n");
 		return -EINVAL;
 	}
 
-- 
2.29.2
