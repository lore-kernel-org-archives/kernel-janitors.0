From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Nov 2015 22:15:39 +0000
Subject: [patch] Smack: harmless underflow in smk_set_cipso()
Message-Id: <20151103221539.GC19280@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This causes a static checker warning because "maplevel" is set by the
user and we cap the upper bound but not the lower bound.  It seems
harmless to me and it's root only but we may as well make the static
checker happy.

Also checkpatch complains that we should use kstrtouint() instead of
sscanf here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/security/smack/smackfs.c b/security/smack/smackfs.c
index 94bd9e4..ebb1241 100644
--- a/security/smack/smackfs.c
+++ b/security/smack/smackfs.c
@@ -862,7 +862,7 @@ static ssize_t smk_set_cipso(struct file *file, const char __user *buf,
 	struct smack_known *skp;
 	struct netlbl_lsm_secattr ncats;
 	char mapcatset[SMK_CIPSOLEN];
-	int maplevel;
+	unsigned int maplevel;
 	unsigned int cat;
 	int catlen;
 	ssize_t rc = -EINVAL;
@@ -912,8 +912,8 @@ static ssize_t smk_set_cipso(struct file *file, const char __user *buf,
 	else
 		rule += strlen(skp->smk_known) + 1;
 
-	ret = sscanf(rule, "%d", &maplevel);
-	if (ret != 1 || maplevel > SMACK_CIPSO_MAXLEVEL)
+	ret = kstrtouint(rule, 10, &maplevel);
+	if (ret || maplevel > SMACK_CIPSO_MAXLEVEL)
 		goto out;
 
 	rule += SMK_DIGITLEN;
