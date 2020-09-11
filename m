From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 11 Sep 2020 11:33:26 +0000
Subject: [PATCH] mfd: sm501: Fix leaks in probe()
Message-Id: <20200911113326.GB367487@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: Ben Dooks <ben@fluff.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Vincent Sanders <vince@arm.linux.org.uk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This code should clean up if sm501_init_dev() fails.

Fixes: b6d6454fdb66 ("[PATCH] mfd: SM501 core driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mfd/sm501.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
index ccd62b963952..6d2f4a0a901d 100644
--- a/drivers/mfd/sm501.c
+++ b/drivers/mfd/sm501.c
@@ -1415,8 +1415,14 @@ static int sm501_plat_probe(struct platform_device *dev)
 		goto err_claim;
 	}
 
-	return sm501_init_dev(sm);
+	ret = sm501_init_dev(sm);
+	if (ret)
+		goto err_unmap;
+
+	return 0;
 
+ err_unmap:
+	iounmap(sm->regs);
  err_claim:
 	release_mem_region(sm->io_res->start, 0x100);
  err_res:
-- 
2.28.0
