From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 31 Jan 2013 08:19:09 +0000
Subject: [patch 2/2] target: don't truncate the fail intr address
Message-Id: <20130131081909.GC14812@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

The temporary buffer was only 32 characters but ->last_intr_fail_ip_addr
is a 48 character buffer.  We don't need to use a temporary buffer at
all, we can just print directly to "page".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Compile tested only.

diff --git a/drivers/target/iscsi/iscsi_target_stat.c b/drivers/target/iscsi/iscsi_target_stat.c
index 54a6f38..464b420 100644
--- a/drivers/target/iscsi/iscsi_target_stat.c
+++ b/drivers/target/iscsi/iscsi_target_stat.c
@@ -429,16 +429,19 @@ static ssize_t iscsi_stat_tgt_attr_show_attr_fail_intr_addr(
 	struct iscsi_tiqn *tiqn = container_of(igrps,
 			struct iscsi_tiqn, tiqn_stat_grps);
 	struct iscsi_login_stats *lstat = &tiqn->login_stats;
-	unsigned char buf[32];
+	int ret;
 
 	spin_lock(&lstat->lock);
-	if (lstat->last_intr_fail_ip_family = AF_INET6)
-		snprintf(buf, 32, "[%s]", lstat->last_intr_fail_ip_addr);
-	else
-		snprintf(buf, 32, "%s", lstat->last_intr_fail_ip_addr);
+	if (lstat->last_intr_fail_ip_family = AF_INET6) {
+		ret = snprintf(page, PAGE_SIZE, "[%s]\n",
+			       lstat->last_intr_fail_ip_addr);
+	} else {
+		ret = snprintf(page, PAGE_SIZE, "%s\n",
+			       lstat->last_intr_fail_ip_addr);
+	}
 	spin_unlock(&lstat->lock);
 
-	return snprintf(page, PAGE_SIZE, "%s\n", buf);
+	return ret;
 }
 ISCSI_STAT_TGT_ATTR_RO(fail_intr_addr);
 
