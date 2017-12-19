From: Colin King <colin.king@canonical.com>
Date: Tue, 19 Dec 2017 17:35:30 +0000
Subject: [PATCH] mei: fix incorrect logical operator in if statement
Message-Id: <20171219173530.15864-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomas Winkler <tomas.winkler@intel.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The current expression using the || operator is always true because
dev->dev_state cannot be equal to two different values at the same time.
Fix this by replacing the || with &&.

Detected by CoverityScan, CID#1463042 ("Constant expression result")

Fixes: 8d52af6795c0 ("mei: speed up the power down flow")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/misc/mei/hw-me.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/mei/hw-me.c b/drivers/misc/mei/hw-me.c
index 0b21f9ec00f5..334ab02e1de2 100644
--- a/drivers/misc/mei/hw-me.c
+++ b/drivers/misc/mei/hw-me.c
@@ -1261,7 +1261,7 @@ irqreturn_t mei_me_irq_thread_handler(int irq, void *dev_id)
 			break;
 
 		if (rets &&
-		    (dev->dev_state != MEI_DEV_RESETTING ||
+		    (dev->dev_state != MEI_DEV_RESETTING &&
 		     dev->dev_state != MEI_DEV_POWER_DOWN)) {
 			dev_err(dev->dev, "mei_irq_read_handler ret = %d.\n",
 						rets);
-- 
2.14.1

