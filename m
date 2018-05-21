From: Colin King <colin.king@canonical.com>
Date: Mon, 21 May 2018 09:25:02 +0000
Subject: [PATCH] [media] hdpvr: fix spelling mistake: "Hauppage" -> "Hauppauge"
Message-Id: <20180521092502.18141-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in name field

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/hdpvr/hdpvr-i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/hdpvr/hdpvr-i2c.c b/drivers/media/usb/hdpvr/hdpvr-i2c.c
index 4720d79b0282..c71ddefd2e58 100644
--- a/drivers/media/usb/hdpvr/hdpvr-i2c.c
+++ b/drivers/media/usb/hdpvr/hdpvr-i2c.c
@@ -173,7 +173,7 @@ static const struct i2c_algorithm hdpvr_algo = {
 };
 
 static const struct i2c_adapter hdpvr_i2c_adapter_template = {
-	.name   = "Hauppage HD PVR I2C",
+	.name   = "Hauppauge HD PVR I2C",
 	.owner  = THIS_MODULE,
 	.algo   = &hdpvr_algo,
 };
-- 
2.17.0

