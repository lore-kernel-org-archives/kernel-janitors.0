From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 02 Mar 2012 06:58:32 +0000
Subject: [patch] dma-debug: debugfs_create_bool() takes a u32 pointer
Message-Id: <20120302065832.GE24508@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joerg.roedel@amd.com>
Cc: Stanislaw Gruszka <sgruszka@redhat.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Neil Horman <nhorman@tuxdriver.com>, Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Even though it has "bool" in the name, you have pass a u32 pointer to
debugfs_create_bool().  Otherwise you get memory corruption in
write_file_bool().  Fortunately in this case the corruption happens in
an alignment hole between variables so it doesn't cause any problems.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/lib/dma-debug.c b/lib/dma-debug.c
index 13ef233..08cd5a6 100644
--- a/lib/dma-debug.c
+++ b/lib/dma-debug.c
@@ -78,7 +78,7 @@ static LIST_HEAD(free_entries);
 static DEFINE_SPINLOCK(free_entries_lock);
 
 /* Global disable flag - will be set in case of an error */
-static bool global_disable __read_mostly;
+static u32 global_disable __read_mostly;
 
 /* Global error count */
 static u32 error_count;
@@ -657,7 +657,7 @@ static int dma_debug_fs_init(void)
 
 	global_disable_dent = debugfs_create_bool("disabled", 0444,
 			dma_debug_dent,
-			(u32 *)&global_disable);
+			&global_disable);
 	if (!global_disable_dent)
 		goto out_err;
 
