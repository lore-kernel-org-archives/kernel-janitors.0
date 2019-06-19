From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 Jun 2019 05:32:05 +0000
Subject: [PATCH] NTB: test: remove a duplicate check
Message-Id: <20190619053205.GA10452@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jon Mason <jdmason@kudzu.us>, Logan Gunthorpe <logang@deltatee.com>
Cc: Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, linux-ntb@googlegroups.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We already verified that the "nm->isr_ctx" allocation succeeded so there
is no need to check again here.

Fixes: a6bed7a54165 ("NTB: Introduce NTB MSI Test Client")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Hey Logan, can pick a patch prefix when you're introducing a new module?
"[PATCH] NTB/test: Introduce NTB MSI Test Client" or whatever.

 drivers/ntb/test/ntb_msi_test.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/ntb/test/ntb_msi_test.c b/drivers/ntb/test/ntb_msi_test.c
index 99d826ed9c34..9ba3c3162cd0 100644
--- a/drivers/ntb/test/ntb_msi_test.c
+++ b/drivers/ntb/test/ntb_msi_test.c
@@ -372,9 +372,6 @@ static int ntb_msit_probe(struct ntb_client *client, struct ntb_dev *ntb)
 	if (ret)
 		goto remove_dbgfs;
 
-	if (!nm->isr_ctx)
-		goto remove_dbgfs;
-
 	ntb_link_enable(ntb, NTB_SPEED_AUTO, NTB_WIDTH_AUTO);
 
 	return 0;
-- 
2.20.1
