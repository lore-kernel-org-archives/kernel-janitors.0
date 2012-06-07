From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Jun 2012 08:23:26 +0000
Subject: [patch] [SCSI] libfcoe: remove and unneeded check
Message-Id: <20120607082326.GB7582@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Love <robert.w.love@intel.com>
Cc: "James E.J. Bottomley" <JBottomley@parallels.com>, devel@open-fcoe.org, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

Unsigned values are never less than zero.  We check for an upper bound
later so that's OK too.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/fcoe/fcoe_sysfs.c b/drivers/scsi/fcoe/fcoe_sysfs.c
index 2bc1631..6e402f6 100644
--- a/drivers/scsi/fcoe/fcoe_sysfs.c
+++ b/drivers/scsi/fcoe/fcoe_sysfs.c
@@ -102,8 +102,8 @@ static int fcoe_str_to_dev_loss(const char *buf, unsigned long *val)
 	int ret;
 
 	ret = kstrtoul(buf, 0, val);
-	if (ret || *val < 0)
-		return -EINVAL;
+	if (ret)
+		return ret;
 	/*
 	 * Check for overflow; dev_loss_tmo is u32
 	 */
