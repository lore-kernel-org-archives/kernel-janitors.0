From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 10 Aug 2015 21:29:55 +0000
Subject: [patch] quota: remove an unneeded condition
Message-Id: <20150810212955.GA31724@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We know "ret" is zero here so we can remove this condition.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/quota/quota.c b/fs/quota/quota.c
index 86ded73..3746367 100644
--- a/fs/quota/quota.c
+++ b/fs/quota/quota.c
@@ -141,9 +141,9 @@ static int quota_getinfo(struct super_block *sb, int type, void __user *addr)
 	if (tstate->flags & QCI_ROOT_SQUASH)
 		uinfo.dqi_flags |= DQF_ROOT_SQUASH;
 	uinfo.dqi_valid = IIF_ALL;
-	if (!ret && copy_to_user(addr, &uinfo, sizeof(uinfo)))
+	if (copy_to_user(addr, &uinfo, sizeof(uinfo)))
 		return -EFAULT;
-	return ret;
+	return 0;
 }
 
 static int quota_setinfo(struct super_block *sb, int type, void __user *addr)
