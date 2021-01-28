From: Colin King <colin.king@canonical.com>
Date: Thu, 28 Jan 2021 12:19:03 +0000
Subject: [PATCH][next] Input: iqs5xx: Ensure error_bl is initialized on error exit path
Message-Id: <20210128121903.636652-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently if the call to qs5xx_fw_file_parse fails the error return
exit path will read the uninitialized variable error_bl. Fix this
by ensuring error_bl is initialized to zero.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: 2539da6677b6 ("Input: iqs5xx - preserve bootloader errors")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/input/touchscreen/iqs5xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index 05e0c6ff217b..54f30038dca4 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -852,7 +852,7 @@ static int iqs5xx_fw_file_parse(struct i2c_client *client,
 static int iqs5xx_fw_file_write(struct i2c_client *client, const char *fw_file)
 {
 	struct iqs5xx_private *iqs5xx = i2c_get_clientdata(client);
-	int error, error_bl;
+	int error, error_bl = 0;
 	u8 *pmap;
 
 	if (iqs5xx->bl_status = IQS5XX_BL_STATUS_NONE)
-- 
2.29.2
