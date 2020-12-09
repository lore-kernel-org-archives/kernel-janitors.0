From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Dec 2020 06:52:36 +0000
Subject: [PATCH] media: ccs: Remove uninitialized, unused variable
Message-Id: <X9B0NIm4Iv4uFlkT@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The "reg" value isn't used any more but it's still printed in the
debug code.  Delete it.

Fixes: fd9065812c7b ("media: smiapp: Obtain frame descriptor from CCS limits")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/i2c/ccs/ccs-core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 4447ca367a84..7a461c0a730d 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -268,7 +268,6 @@ static int ccs_read_frame_fmt(struct ccs_sensor *sensor)
 		u32 pixels;
 		char *which;
 		char *what;
-		u32 reg;
 
 		if (fmt_model_type = CCS_FRAME_FORMAT_MODEL_TYPE_2_BYTE) {
 			desc = CCS_LIM_AT(sensor, FRAME_FORMAT_DESCRIPTOR, i);
@@ -322,7 +321,7 @@ static int ccs_read_frame_fmt(struct ccs_sensor *sensor)
 		}
 
 		dev_dbg(&client->dev,
-			"0x%8.8x %s pixels: %d %s (pixelcode %u)\n", reg,
+			"%s pixels: %d %s (pixelcode %u)\n",
 			what, pixels, which, pixelcode);
 
 		if (i < ncol_desc) {
-- 
2.29.2
