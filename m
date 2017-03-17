From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 17 Mar 2017 20:52:35 +0000
Subject: [PATCH] bna: integer overflow bug in debugfs
Message-Id: <20170317205234.GA2888@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rasesh Mody <rasesh.mody@cavium.com>, Krishna Gudipati <kgudipat@brocade.com>
Cc: Sudarsana Kalluru <sudarsana.kalluru@cavium.com>, Dept-GELinuxNICDev@cavium.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We could allocate less memory than intended because we do:

	bnad->regdata = kzalloc(len << 2, GFP_KERNEL);

The shift can overflow leading to a crash.  This is debugfs code so the
impact is very small.

Fixes: 7afc5dbde091 ("bna: Add debugfs interface.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/brocade/bna/bnad_debugfs.c b/drivers/net/ethernet/brocade/bna/bnad_debugfs.c
index 05c1c1dd7751..cebfe3bd086e 100644
--- a/drivers/net/ethernet/brocade/bna/bnad_debugfs.c
+++ b/drivers/net/ethernet/brocade/bna/bnad_debugfs.c
@@ -325,7 +325,7 @@ bnad_debugfs_write_regrd(struct file *file, const char __user *buf,
 		return PTR_ERR(kern_buf);
 
 	rc = sscanf(kern_buf, "%x:%x", &addr, &len);
-	if (rc < 2) {
+	if (rc < 2 || len > UINT_MAX >> 2) {
 		netdev_warn(bnad->netdev, "failed to read user buffer\n");
 		kfree(kern_buf);
 		return -EINVAL;
