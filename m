From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 31 Jan 2013 08:17:54 +0000
Subject: [patch 1/2] target: don't always say "ipv6" as address type
Message-Id: <20130131081754.GB14812@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

"lstat->last_intr_fail_ip_addr" is an array inside the "lstat" struct.
It's never NULL so we always print "ipv6\n" here.  The test should be
"if (lstat->last_intr_fail_ip_family = AF_INET6)".

We don't need the temporary buffer either.  We could print directly into
"page".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Compile tested only.

diff --git a/drivers/target/iscsi/iscsi_target_stat.c b/drivers/target/iscsi/iscsi_target_stat.c
index 421d694..54a6f38 100644
--- a/drivers/target/iscsi/iscsi_target_stat.c
+++ b/drivers/target/iscsi/iscsi_target_stat.c
@@ -410,14 +410,16 @@ static ssize_t iscsi_stat_tgt_attr_show_attr_fail_intr_addr_type(
 	struct iscsi_tiqn *tiqn = container_of(igrps,
 			struct iscsi_tiqn, tiqn_stat_grps);
 	struct iscsi_login_stats *lstat = &tiqn->login_stats;
-	unsigned char buf[8];
+	int ret;
 
 	spin_lock(&lstat->lock);
-	snprintf(buf, 8, "%s", (lstat->last_intr_fail_ip_addr != NULL) ?
-				"ipv6" : "ipv4");
+	if (lstat->last_intr_fail_ip_family = AF_INET6)
+		ret = snprintf(page, PAGE_SIZE, "ipv6\n");
+	else
+		ret = snprintf(page, PAGE_SIZE, "ipv4\n");
 	spin_unlock(&lstat->lock);
 
-	return snprintf(page, PAGE_SIZE, "%s\n", buf);
+	return ret;
 }
 ISCSI_STAT_TGT_ATTR_RO(fail_intr_addr_type);
 
