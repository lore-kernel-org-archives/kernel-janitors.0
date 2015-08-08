From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 08 Aug 2015 19:15:25 +0000
Subject: [patch 1/2 -mainline] cxgb4: missing curly braces in t4_setup_debugfs()
Message-Id: <20150808191525.GB8034@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hariprasad S <hariprasad@chelsio.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

There were missing curly braces so it means we call add_debugfs_mem()
unintentionally.

Fixes: 3ccc6cf74d8c ('cxgb4: Adds support for T6 adapter')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c
index b657734..9e0b670 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c
@@ -2665,10 +2665,11 @@ int t4_setup_debugfs(struct adapter *adap)
 					EXT_MEM1_SIZE_G(size));
 		}
 	} else {
-		if (i & EXT_MEM_ENABLE_F)
+		if (i & EXT_MEM_ENABLE_F) {
 			size = t4_read_reg(adap, MA_EXT_MEMORY_BAR_A);
 			add_debugfs_mem(adap, "mc", MEM_MC,
 					EXT_MEM_SIZE_G(size));
+		}
 	}
 
 	de = debugfs_create_file_size("flash", S_IRUSR, adap->debugfs_root, adap,
