From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Jun 2017 10:40:02 +0000
Subject: [PATCH] apparmor: fix error code in aafs_create()
Message-Id: <20170614104002.GL29394@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-security-module@vger.kernel.org

We accidentally return ERR_PTR(0) if lookup_one_len() fails.  The caller
is expecting error pointers so it likely causes problems later on.  For
example, on one path I saw it triggered an AA_BUG().

Fixes: a481f4d91783 ("apparmor: add custom apparmorfs that will be used by policy namespace files")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/security/apparmor/apparmorfs.c b/security/apparmor/apparmorfs.c
index 853c2ec8e0c9..2caeb748070c 100644
--- a/security/apparmor/apparmorfs.c
+++ b/security/apparmor/apparmorfs.c
@@ -248,8 +248,10 @@ static struct dentry *aafs_create(const char *name, umode_t mode,
 
 	inode_lock(dir);
 	dentry = lookup_one_len(name, parent, strlen(name));
-	if (IS_ERR(dentry))
+	if (IS_ERR(dentry)) {
+		error = PTR_ERR(dentry);
 		goto fail_lock;
+	}
 
 	if (d_really_is_positive(dentry)) {
 		error = -EEXIST;
