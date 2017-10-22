From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Oct 2017 19:32:46 +0000
Subject: [PATCH] gpu/drm/bridge/sii9234: Use common error handling code in sii9234_writebm()
Message-Id: <8bb4a1d2-8876-731f-2938-8be075f4252c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>, Archit Taneja <architt@codeaurora.org>, David Airlie <airlied@linux.ie>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Maciej Purski <m.purski@samsung.com>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Oct 2017 21:21:44 +0200

* Add a jump target so that a bit of exception handling can be better
  reused at the end of this function.

  This issue was detected by using the Coccinelle software.

* Adjust condition checks.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/bridge/sii9234.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
index c77000626c22..fbdacdaf485c 100644
--- a/drivers/gpu/drm/bridge/sii9234.c
+++ b/drivers/gpu/drm/bridge/sii9234.c
@@ -231,30 +231,22 @@ static int sii9234_writebm(struct sii9234 *ctx, int id, int offset,
 		return ctx->i2c_error;
 
 	ret = i2c_smbus_write_byte(client, offset);
-	if (ret < 0) {
-		dev_err(ctx->dev, "writebm: %4s[0x%02x] <- 0x%02x\n",
-			sii9234_client_name[id], offset, value);
-		ctx->i2c_error = ret;
-		return ret;
-	}
+	if (ret)
+		goto report_failure;
 
 	ret = i2c_smbus_read_byte(client);
-	if (ret < 0) {
-		dev_err(ctx->dev, "writebm: %4s[0x%02x] <- 0x%02x\n",
-			sii9234_client_name[id], offset, value);
-		ctx->i2c_error = ret;
-		return ret;
-	}
+	if (ret)
+		goto report_failure;
 
 	value = (value & mask) | (ret & ~mask);
-
 	ret = i2c_smbus_write_byte_data(client, offset, value);
-	if (ret < 0) {
-		dev_err(ctx->dev, "writebm: %4s[0x%02x] <- 0x%02x\n",
-			sii9234_client_name[id], offset, value);
-		ctx->i2c_error = ret;
-	}
+	if (!ret)
+		return 0;
 
+report_failure:
+	dev_err(ctx->dev, "writebm: %4s[0x%02x] <- 0x%02x\n",
+		sii9234_client_name[id], offset, value);
+	ctx->i2c_error = ret;
 	return ret;
 }
 
-- 
2.14.2

