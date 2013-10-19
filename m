From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 19 Oct 2013 09:17:12 +0000
Subject: [patch] pktcdvd: debugfs functions return NULL on error
Message-Id: <20131019091712.GI9312@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jkosina@suse.cz>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

My static checker complains correctly that this is potential NULL
dereference because debugfs functions return NULL on error.  They return
an ERR_PTR if they are configured out.

We don't need to check for ERR_PTR because if debugfs is stubbed out the
dummy functions won't complain about that.  We don't need to check the
values before calling debugfs_remove() because that accepts ERR_PTRs and
NULL pointers.

We don't need to set pkt->dfs_f_info to NULL in pkt_debugfs_dev_new()
because it was initialized with kzalloc() so I have removed that.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
index 5618847..ff8668c 100644
--- a/drivers/block/pktcdvd.c
+++ b/drivers/block/pktcdvd.c
@@ -473,45 +473,31 @@ static void pkt_debugfs_dev_new(struct pktcdvd_device *pd)
 {
 	if (!pkt_debugfs_root)
 		return;
-	pd->dfs_f_info = NULL;
 	pd->dfs_d_root = debugfs_create_dir(pd->name, pkt_debugfs_root);
-	if (IS_ERR(pd->dfs_d_root)) {
-		pd->dfs_d_root = NULL;
+	if (!pd->dfs_d_root)
 		return;
-	}
+
 	pd->dfs_f_info = debugfs_create_file("info", S_IRUGO,
 				pd->dfs_d_root, pd, &debug_fops);
-	if (IS_ERR(pd->dfs_f_info)) {
-		pd->dfs_f_info = NULL;
-		return;
-	}
 }
 
 static void pkt_debugfs_dev_remove(struct pktcdvd_device *pd)
 {
 	if (!pkt_debugfs_root)
 		return;
-	if (pd->dfs_f_info)
-		debugfs_remove(pd->dfs_f_info);
+	debugfs_remove(pd->dfs_f_info);
+	debugfs_remove(pd->dfs_d_root);
 	pd->dfs_f_info = NULL;
-	if (pd->dfs_d_root)
-		debugfs_remove(pd->dfs_d_root);
 	pd->dfs_d_root = NULL;
 }
 
 static void pkt_debugfs_init(void)
 {
 	pkt_debugfs_root = debugfs_create_dir(DRIVER_NAME, NULL);
-	if (IS_ERR(pkt_debugfs_root)) {
-		pkt_debugfs_root = NULL;
-		return;
-	}
 }
 
 static void pkt_debugfs_cleanup(void)
 {
-	if (!pkt_debugfs_root)
-		return;
 	debugfs_remove(pkt_debugfs_root);
 	pkt_debugfs_root = NULL;
 }
