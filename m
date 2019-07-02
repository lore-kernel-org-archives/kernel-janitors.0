From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 02 Jul 2019 14:38:06 +0000
Subject: [PATCH] NFS: Less function calls in show_pnfs()
Message-Id: <d2f73c3e-a55f-5fb7-a8f8-0dc3ce8ff8a5@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-nfs@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>, Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 2 Jul 2019 16:30:53 +0200

Reduce function calls for data output into a sequence.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/nfs/super.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/nfs/super.c b/fs/nfs/super.c
index f88ddac2dcdf..c301cd585b3b 100644
--- a/fs/nfs/super.c
+++ b/fs/nfs/super.c
@@ -749,11 +749,10 @@ static void show_sessions(struct seq_file *m, struct nfs_server *server) {}
 #ifdef CONFIG_NFS_V4_1
 static void show_pnfs(struct seq_file *m, struct nfs_server *server)
 {
-	seq_printf(m, ",pnfs=");
-	if (server->pnfs_curr_ld)
-		seq_printf(m, "%s", server->pnfs_curr_ld->name);
-	else
-		seq_printf(m, "not configured");
+	seq_printf(m, ",pnfs=%s",
+		   server->pnfs_curr_ld
+		   ? server->pnfs_curr_ld->name
+		   : "not configured");
 }

 static void show_implementation_id(struct seq_file *m, struct nfs_server *nfss)
--
2.22.0
