From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Dec 2017 10:28:41 +0000
Subject: [PATCH 1/7] rapidio: Delete an error message for a failed memory allocation in rio_init_mports()
Message-Id: <dfd6887b-2521-cbf2-af5b-e70b5fa4c33c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f6e4d185-2c9d-a31d-793d-bda521c450ea@users.sourceforge.net>
In-Reply-To: <f6e4d185-2c9d-a31d-793d-bda521c450ea@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Alexandre Bounine <alexandre.bounine@idt.com>, Matt Porter <mporter@kernel.crashing.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 14 Dec 2017 15:11:12 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/rapidio/rio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rapidio/rio.c b/drivers/rapidio/rio.c
index 38d949405618..032ede23a8cb 100644
--- a/drivers/rapidio/rio.c
+++ b/drivers/rapidio/rio.c
@@ -2189,7 +2189,6 @@ int rio_init_mports(void)
 
 	work = kcalloc(n, sizeof *work, GFP_KERNEL);
 	if (!work) {
-		pr_err("RIO: no memory for work struct\n");
 		destroy_workqueue(rio_wq);
 		goto no_disc;
 	}
-- 
2.15.1

