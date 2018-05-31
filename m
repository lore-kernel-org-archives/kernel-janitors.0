From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 31 May 2018 06:47:36 +0000
Subject: [PATCH] autofs: small cleanup in autofs_getpath()
Message-Id: <20180531064736.lnisb55eajwjynvk@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ian Kent <raven@themaw.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mark Brown <broonie@kernel.org>, Ingo Molnar <mingo@kernel.org>, NeilBrown <neilb@suse.com>, "Eric W. Biederman" <ebiederm@xmission.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We don't set "*name" so it's slightly nicer to just pass "name" instead
of "&name".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/autofs/waitq.c b/fs/autofs/waitq.c
index 8c858126c751..f6385c6ef0a5 100644
--- a/fs/autofs/waitq.c
+++ b/fs/autofs/waitq.c
@@ -179,7 +179,7 @@ static void autofs_notify_daemon(struct autofs_sb_info *sbi,
 }
 
 static int autofs_getpath(struct autofs_sb_info *sbi,
-			  struct dentry *dentry, char **name)
+			  struct dentry *dentry, char *name)
 {
 	struct dentry *root = sbi->sb->s_root;
 	struct dentry *tmp;
@@ -189,7 +189,7 @@ static int autofs_getpath(struct autofs_sb_info *sbi,
 	unsigned seq;
 
 rename_retry:
-	buf = *name;
+	buf = name;
 	len = 0;
 
 	seq = read_seqbegin(&rename_lock);
@@ -395,7 +395,7 @@ int autofs_wait(struct autofs_sb_info *sbi,
 	if (IS_ROOT(dentry) && autofs_type_trigger(sbi->type))
 		qstr.len = sprintf(name, "%p", dentry);
 	else {
-		qstr.len = autofs_getpath(sbi, dentry, &name);
+		qstr.len = autofs_getpath(sbi, dentry, name);
 		if (!qstr.len) {
 			kfree(name);
 			return -ENOENT;
