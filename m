From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 Jan 2021 08:41:09 +0000
Subject: [PATCH 2/3] powercap/drivers/dtpm: Fix some missing unlock bugs
Message-Id: <X/V3pV//ui0rcxbs@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We need to unlock on these paths before returning.

Fixes: a20d0ef97abf ("powercap/drivers/dtpm: Add API for dynamic thermal power management")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/powercap/dtpm.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/powercap/dtpm.c b/drivers/powercap/dtpm.c
index d49df0569cd4..470a1182b868 100644
--- a/drivers/powercap/dtpm.c
+++ b/drivers/powercap/dtpm.c
@@ -147,13 +147,17 @@ static void __dtpm_add_power(struct dtpm *dtpm)
  */
 int dtpm_update_power(struct dtpm *dtpm, u64 power_min, u64 power_max)
 {
+	int ret = 0;
+
 	mutex_lock(&dtpm_lock);
 
 	if (power_min = dtpm->power_min && power_max = dtpm->power_max)
-		return 0;
+		goto unlock;
 
-	if (power_max < power_min)
-		return -EINVAL;
+	if (power_max < power_min) {
+		ret = -EINVAL;
+		goto unlock;
+	}
 
 	__dtpm_sub_power(dtpm);
 
@@ -164,9 +168,10 @@ int dtpm_update_power(struct dtpm *dtpm, u64 power_min, u64 power_max)
 
 	__dtpm_add_power(dtpm);
 
+unlock:
 	mutex_unlock(&dtpm_lock);
 
-	return 0;
+	return ret;
 }
 
 /**
@@ -187,8 +192,10 @@ int dtpm_release_zone(struct powercap_zone *pcz)
 
 	mutex_lock(&dtpm_lock);
 
-	if (!list_empty(&dtpm->children))
+	if (!list_empty(&dtpm->children)) {
+		mutex_unlock(&dtpm_lock);
 		return -EBUSY;
+	}
 
 	if (parent)
 		list_del(&dtpm->sibling);
-- 
2.29.2
