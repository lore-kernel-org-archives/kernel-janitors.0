From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 03 May 2014 20:21:35 +0000
Subject: [patch] [SCSI] qla2xxx: fix incorrect debug printk
Message-Id: <20140503202135.GD32753@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: qla2xxx-upstream@qlogic.com
Cc: "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

There are missing curly braces here so it prints that the recovery
failed even when it succeeded.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
static checker stuff.  not tested.

diff --git a/drivers/scsi/qla2xxx/qla_os.c b/drivers/scsi/qla2xxx/qla_os.c
index afc8481..00754a2 100644
--- a/drivers/scsi/qla2xxx/qla_os.c
+++ b/drivers/scsi/qla2xxx/qla_os.c
@@ -4913,12 +4913,13 @@ qla2x00_do_dpc(void *data)
 				if (qlafx00_reset_initialize(base_vha)) {
 					/* Failed. Abort isp later. */

+					    &base_vha->dpc_flags)) {
 						set_bit(ISP_UNRECOVERABLE,
 						    &base_vha->dpc_flags);
 						ql_dbg(ql_dbg_dpc, base_vha,
 						    0x4021,
 						    "Reset Recovery Failed\n");
+					}
 				}
 			}
 
