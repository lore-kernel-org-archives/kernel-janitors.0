From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Jan 2019 19:54:54 +0000
Subject: [PATCH] media: s5k4ecgx: delete a bogus error message
Message-Id: <20190115195454.GC1074@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Sangwook Lee <sangwook.lee@linaro.org>
Cc: Hans Verkuil <hans.verkuil@cisco.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

This function prints an error message on success.  I don't have the
hardware, I just noticed this while reading the code.

Fixes: 8b99312b7214 ("[media] Add v4l2 subdev driver for S5K4ECGX sensor")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/media/i2c/s5k4ecgx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/s5k4ecgx.c b/drivers/media/i2c/s5k4ecgx.c
index 79aa2740edc4..79c1894c2c83 100644
--- a/drivers/media/i2c/s5k4ecgx.c
+++ b/drivers/media/i2c/s5k4ecgx.c
@@ -263,8 +263,6 @@ static int s5k4ecgx_read(struct i2c_client *client, u32 addr, u16 *val)
 		ret = s5k4ecgx_i2c_write(client, REG_CMDRD_ADDRL, low);
 	if (!ret)
 		ret = s5k4ecgx_i2c_read(client, REG_CMDBUF0_ADDR, val);
-	if (!ret)
-		dev_err(&client->dev, "Failed to execute read command\n");
 
 	return ret;
 }
-- 
2.17.1
