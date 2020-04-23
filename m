From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 23 Apr 2020 20:46:20 +0000
Subject: [PATCH] scsi: fnic: Use kmalloc instead of vmalloc for a small memory allocation
Message-Id: <20200423204620.26395-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: satishkh@cisco.com, sebaddel@cisco.com, kartilak@cisco.com, jejb@linux.ibm.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'struct fc_trace_flag_type' is just a few bytes long. There is no need
to allocate such a structure with vmalloc. Using kmalloc instead.

While at it, axe a useless test when freeing the memory.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/scsi/fnic/fnic_debugfs.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/fnic/fnic_debugfs.c b/drivers/scsi/fnic/fnic_debugfs.c
index 13f7d88d6e57..8d6ce3470594 100644
--- a/drivers/scsi/fnic/fnic_debugfs.c
+++ b/drivers/scsi/fnic/fnic_debugfs.c
@@ -58,8 +58,7 @@ int fnic_debugfs_init(void)
 						fnic_trace_debugfs_root);
 
 	/* Allocate memory to structure */
-	fc_trc_flag = (struct fc_trace_flag_type *)
-		vmalloc(sizeof(struct fc_trace_flag_type));
+	fc_trc_flag = kmalloc(sizeof(*fc_trc_flag), GFP_KERNEL);
 
 	if (fc_trc_flag) {
 		fc_trc_flag->fc_row_file = 0;
@@ -87,8 +86,7 @@ void fnic_debugfs_terminate(void)
 	debugfs_remove(fnic_trace_debugfs_root);
 	fnic_trace_debugfs_root = NULL;
 
-	if (fc_trc_flag)
-		vfree(fc_trc_flag);
+	kfree(fc_trc_flag);
 }
 
 /*
-- 
2.20.1
