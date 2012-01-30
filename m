From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 30 Jan 2012 13:39:59 +0000
Subject: [patch 1/2] sysctl: remove an unused variable
Message-Id: <20120130133959.GB5926@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"links" is never used, so we can remove it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
index 8dc7f0e..1b1f5b8 100644
--- a/fs/proc/proc_sysctl.c
+++ b/fs/proc/proc_sysctl.c
@@ -1165,7 +1165,6 @@ struct ctl_table_header *__register_sysctl_table(
 	const char *path, struct ctl_table *table)
 {
 	struct ctl_table_root *root = set->dir.header.root;
-	struct ctl_table_header *links = NULL;
 	struct ctl_table_header *header;
 	const char *name, *nextname;
 	struct ctl_dir *dir;
@@ -1222,7 +1221,6 @@ fail_put_dir_locked:
 	drop_sysctl_table(&dir->header);
 	spin_unlock(&sysctl_lock);
 fail:
-	kfree(links);
 	kfree(header);
 	dump_stack();
 	return NULL;
