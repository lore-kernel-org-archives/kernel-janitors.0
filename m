From: Ben Werbowyj <ben.werbowyj@gmail.com>
Date: Sat, 23 Jul 2016 22:45:22 +0000
Subject: [PATCH 2/2] drivers: w1: fix order of operands in comparisons
Message-Id: <1469313922-3453-3-git-send-email-ben.werbowyj@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Coding style corrections as identified by checkpatch.pl script.
Re-ordered comparisons to have constants on the right hand side.

Signed-off-by: Ben Werbowyj <ben.werbowyj@gmail.com>
---
 drivers/w1/masters/omap_hdq.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/w1/masters/omap_hdq.c b/drivers/w1/masters/omap_hdq.c
index 7d0987d..d95ca8d 100644
--- a/drivers/w1/masters/omap_hdq.c
+++ b/drivers/w1/masters/omap_hdq.c
@@ -438,14 +438,14 @@ static int omap_hdq_get(struct hdq_data *hdq_data)
 		goto rtn;
 	}
 
-	if (OMAP_HDQ_MAX_USER = hdq_data->hdq_usecount) {
+	if (hdq_data->hdq_usecount = OMAP_HDQ_MAX_USER) {
 		dev_dbg(hdq_data->dev, "attempt to exceed the max use count");
 		ret = -EINVAL;
 		goto out;
 	} else {
 		hdq_data->hdq_usecount++;
 		try_module_get(THIS_MODULE);
-		if (1 = hdq_data->hdq_usecount) {
+		if (hdq_data->hdq_usecount = 1) {
 
 			pm_runtime_get_sync(hdq_data->dev);
 
@@ -486,14 +486,14 @@ static int omap_hdq_put(struct hdq_data *hdq_data)
 
 	hdq_reg_out(hdq_data, OMAP_HDQ_SYSCONFIG,
 		    OMAP_HDQ_SYSCONFIG_AUTOIDLE);
-	if (0 = hdq_data->hdq_usecount) {
+	if (hdq_data->hdq_usecount = 0) {
 		dev_dbg(hdq_data->dev,
 			"attempt to decrement use count when it is zero");
 		ret = -EINVAL;
 	} else {
 		hdq_data->hdq_usecount--;
 		module_put(THIS_MODULE);
-		if (0 = hdq_data->hdq_usecount)
+		if (hdq_data->hdq_usecount = 0)
 			pm_runtime_put_sync(hdq_data->dev);
 	}
 	mutex_unlock(&hdq_data->hdq_mutex);
-- 
2.1.4

