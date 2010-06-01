From: Dan Carpenter <error27@gmail.com>
Date: Tue, 01 Jun 2010 07:05:44 +0000
Subject: [patch] cciss: call BUG() earlier
Message-Id: <20100601070544.GC5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I moved the range check after the increment.  The current code would 
write past the end of the array once before calling BUG().

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/block/cciss_scsi.c b/drivers/block/cciss_scsi.c
index e1d0e2c..3381505 100644
--- a/drivers/block/cciss_scsi.c
+++ b/drivers/block/cciss_scsi.c
@@ -188,11 +188,11 @@ scsi_cmd_free(ctlr_info_t *h, CommandList_struct *cmd)
 
 	sa = h->scsi_ctlr;
 	stk = &sa->cmd_stack; 
+	stk->top++;
 	if (stk->top >= CMD_STACK_SIZE) {
 		printk("cciss: scsi_cmd_free called too many times.\n");
 		BUG();
 	}
-	stk->top++;
 	stk->elem[stk->top] = (struct cciss_scsi_cmd_stack_elem_t *) cmd;
 }
 
