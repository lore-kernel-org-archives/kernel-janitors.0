From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 27 Oct 2017 16:20:02 +0000
Subject: [PATCH] misc: bh1770glc: Use common error handling code in bh1770_power_state_store()
Message-Id: <568ee0ee-8ff1-9739-fa6b-f2eeae53e11a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Jonathan Cameron <jic23@kernel.org>, Samu Onkalo <samu.p.onkalo@nokia.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 27 Oct 2017 18:00:31 +0200

Adjust jump targets so that a bit of exception handling can be better
reused in an if branch of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/bh1770glc.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/bh1770glc.c b/drivers/misc/bh1770glc.c
index 9c62bf064f77..c4c108ed88b0 100644
--- a/drivers/misc/bh1770glc.c
+++ b/drivers/misc/bh1770glc.c
@@ -660,15 +660,14 @@ static ssize_t bh1770_power_state_store(struct device *dev,
 		pm_runtime_get_sync(dev);
 
 		ret = bh1770_lux_rate(chip, chip->lux_rate_index);
-		if (ret < 0) {
-			pm_runtime_put(dev);
-			goto leave;
-		}
+		if (ret < 0)
+			goto put_runtime;
 
 		ret = bh1770_lux_interrupt_control(chip, BH1770_ENABLE);
 		if (ret < 0) {
+put_runtime:
 			pm_runtime_put(dev);
-			goto leave;
+			goto unlock;
 		}
 
 		/* This causes interrupt after the next measurement cycle */
@@ -681,7 +680,7 @@ static ssize_t bh1770_power_state_store(struct device *dev,
 		pm_runtime_put(dev);
 	}
 	ret = count;
-leave:
+unlock:
 	mutex_unlock(&chip->mutex);
 	return ret;
 }
-- 
2.14.3

