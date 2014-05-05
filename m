From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 05 May 2014 09:47:57 +0000
Subject: [patch v2] [SCSI] qla2xxx: fix incorrect debug printk
Message-Id: <20140505094757.GA22383@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140505094506.GM4963@mwanda>
In-Reply-To: <20140505094506.GM4963@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: qla2xxx-upstream@qlogic.com
Cc: "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

There are missing curly braces here so it prints that the recovery
failed even when it succeeded.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: version 1 patch was corrupted in sending somehow.

diff --git a/drivers/scsi/qla2xxx/qla_os.c b/drivers/scsi/qla2xxx/qla_os.c
index afc8481..00754a2 100644
--- a/drivers/scsi/qla2xxx/qla_os.c
+++ b/drivers/scsi/qla2xxx/qla_os.c
@@ -4913,12 +4913,13 @@ qla2x00_do_dpc(void *data)
 				if (qlafx00_reset_initialize(base_vha)) {
 					/* Failed. Abort isp later. */
 					if (!test_bit(UNLOADING,
-					    &base_vha->dpc_flags))
+					    &base_vha->dpc_flags)) {
 						set_bit(ISP_UNRECOVERABLE,
 						    &base_vha->dpc_flags);
 						ql_dbg(ql_dbg_dpc, base_vha,
 						    0x4021,
 						    "Reset Recovery Failed\n");
+					}
 				}
 			}
 
