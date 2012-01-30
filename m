From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 30 Jan 2012 13:40:29 +0000
Subject: [patch 2/2] sysctl: fix memset parameters in setup_sysctl_set()
Message-Id: <20120130134029.GC5926@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The current code is a nop.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
index 1b1f5b8..27e265b 100644
--- a/fs/proc/proc_sysctl.c
+++ b/fs/proc/proc_sysctl.c
@@ -1547,7 +1547,7 @@ void setup_sysctl_set(struct ctl_table_set *set,
 	struct ctl_table_root *root,
 	int (*is_seen)(struct ctl_table_set *))
 {
-	memset(set, sizeof(*set), 0);
+	memset(set, 0, sizeof(*set));
 	set->is_seen = is_seen;
 	init_header(&set->dir.header, root, set, NULL, root_table);
 }
