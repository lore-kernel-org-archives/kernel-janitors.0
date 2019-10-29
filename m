From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 29 Oct 2019 18:24:01 +0000
Subject: [PATCH] media: smiapp: unlock on error in smiapp_start_streaming()
Message-Id: <20191029182401.GB17569@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We added two new error paths to smiapp_start_streaming(), but we can't
return directly without dropping the "sensor->mutex" lock.

Fixes: f8c4352c1bef ("media: smiapp: Move binning configuration to streaming start")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/i2c/smiapp/smiapp-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/smiapp/smiapp-core.c b/drivers/media/i2c/smiapp/smiapp-core.c
index 77dfce7c3be9..84f9771b5fed 100644
--- a/drivers/media/i2c/smiapp/smiapp-core.c
+++ b/drivers/media/i2c/smiapp/smiapp-core.c
@@ -1362,13 +1362,13 @@ static int smiapp_start_streaming(struct smiapp_sensor *sensor)
 		rval = smiapp_write(
 			sensor, SMIAPP_REG_U8_BINNING_TYPE, binning_type);
 		if (rval < 0)
-			return rval;
+			goto out;
 
 		binning_mode = 1;
 	}
 	rval = smiapp_write(sensor, SMIAPP_REG_U8_BINNING_MODE, binning_mode);
 	if (rval < 0)
-		return rval;
+		goto out;
 
 	/* Set up PLL */
 	rval = smiapp_pll_configure(sensor);
-- 
2.20.1
