From: Colin King <colin.king@canonical.com>
Date: Wed, 04 Jul 2018 12:46:11 +0000
Subject: [PATCH][next] usb: typec: unlock dp->lock on error exit path, and also zero ret if successful
Message-Id: <20180704124611.9852-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

One of the error handling paths forgets to unlock dp->lock on the error
exit path leading to a potential lock-up.  Also the return path for a
successful call to the function configuration_store can return an
uninitialized error return code if dp->alt->active is false, so ensure
ret is zeroed on the successful exit path to avoid garbage being returned.

Detected by CoverityScan, CID#1471597 ("Unitialized scalar variable")

Fixes: 0e3bb7d6894d ("usb: typec: Add driver for DisplayPort alternate mode")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/typec/altmodes/displayport.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index ef12b15bd484..9a637c2b4460 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -349,8 +349,10 @@ configuration_store(struct device *dev, struct device_attribute *attr,
 	cap = DP_CAP_CAPABILITY(dp->alt->vdo);
 
 	if ((con = DP_CONF_DFP_D && !(cap & DP_CAP_DFP_D)) ||
-	    (con = DP_CONF_UFP_D && !(cap & DP_CAP_UFP_D)))
-		return -EINVAL;
+	    (con = DP_CONF_UFP_D && !(cap & DP_CAP_UFP_D))) {
+		ret = -EINVAL;
+		goto err_unlock;
+	}
 
 	conf = dp->data.conf & ~DP_CONF_DUAL_D;
 	conf |= con;
@@ -362,6 +364,7 @@ configuration_store(struct device *dev, struct device_attribute *attr,
 	}
 
 	dp->data.conf = conf;
+	ret = 0;
 
 err_unlock:
 	mutex_unlock(&dp->lock);
-- 
2.17.1

