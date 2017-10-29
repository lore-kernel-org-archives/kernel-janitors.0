From: Colin King <colin.king@canonical.com>
Date: Sun, 29 Oct 2017 12:50:58 +0000
Subject: [PATCH] [media] mxl111sf: remove redundant assignment to index
Message-Id: <20171029125058.5588-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Krufky <mkrufky@linuxtv.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable index is set to zero and then set to zero again
a few lines later in a for loop initialization. Remove the
redundant setting of index to zero. Cleans up the clang
warning:

drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c:519:3: warning: Value
stored to 'index' is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c b/drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c
index 0eb33e043079..a221bb8a12b4 100644
--- a/drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c
+++ b/drivers/media/usb/dvb-usb-v2/mxl111sf-i2c.c
@@ -516,7 +516,6 @@ static int mxl111sf_i2c_hw_xfer_msg(struct mxl111sf_state *state,
 		   data required to program */
 		block_len = (msg->len / 8);
 		left_over_len = (msg->len % 8);
-		index = 0;
 
 		mxl_i2c("block_len %d, left_over_len %d",
 			block_len, left_over_len);
-- 
2.14.1

