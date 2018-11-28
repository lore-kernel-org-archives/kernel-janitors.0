From: Colin King <colin.king@canonical.com>
Date: Wed, 28 Nov 2018 15:34:09 +0000
Subject: [PATCH] [media] tda7432: fix spelling mistake "maximium" -> "maximum"
Message-Id: <20181128153409.13941-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the module description as well
as a comment. Fix them.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/i2c/tda7432.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/tda7432.c b/drivers/media/i2c/tda7432.c
index 9b4f21237810..06a78c2cdaab 100644
--- a/drivers/media/i2c/tda7432.c
+++ b/drivers/media/i2c/tda7432.c
@@ -19,7 +19,7 @@
  *
  * loudness - set between 0 and 15 for varying degrees of loudness effect
  *
- * maxvol   - set maximium volume to +20db (1), default is 0db(0)
+ * maxvol   - set maximum volume to +20db (1), default is 0db(0)
  */
 
 #include <linux/module.h>
@@ -53,7 +53,7 @@ MODULE_PARM_DESC(debug, "Set debugging level from 0 to 3. Default is off(0).");
 module_param(loudness, int, S_IRUGO);
 MODULE_PARM_DESC(loudness, "Turn loudness on(1) else off(0). Default is off(0).");
 module_param(maxvol, int, S_IRUGO | S_IWUSR);
-MODULE_PARM_DESC(maxvol, "Set maximium volume to +20dB(0) else +0dB(1). Default is +20dB(0).");
+MODULE_PARM_DESC(maxvol, "Set maximum volume to +20dB(0) else +0dB(1). Default is +20dB(0).");
 
 
 /* Structure of address and subaddresses for the tda7432 */
-- 
2.19.1
