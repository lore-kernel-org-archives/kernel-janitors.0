From: Emil Goode <emilgoode@gmail.com>
Date: Wed, 06 Feb 2013 17:59:12 +0000
Subject: [PATCH] mfd: lpc_ich: Fix arguments to kmalloc
Message-Id: <1360173659-22409-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ptyser@xes-inc.com, sameo@linux.intel.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

This patch changes the order of the arguments to kmalloc,
the allocation flag should be the second argument.

Sparse warnings:

drivers/mfd/lpc_ich.c:881:24: warning:
	incorrect type in argument 1 (different base types)
	drivers/mfd/lpc_ich.c:881:24:
	expected unsigned long [unsigned] [usertype] size
	drivers/mfd/lpc_ich.c:881:24:    got restricted gfp_t

drivers/mfd/lpc_ich.c:881:36: warning:
	incorrect type in argument 2 (different base types)
	drivers/mfd/lpc_ich.c:881:36:
	expected restricted gfp_t [usertype] flags
	drivers/mfd/lpc_ich.c:881:36:    got unsigned long

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/mfd/lpc_ich.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
index a0cfdf9..3af8590 100644
--- a/drivers/mfd/lpc_ich.c
+++ b/drivers/mfd/lpc_ich.c
@@ -878,7 +878,7 @@ static int lpc_ich_probe(struct pci_dev *dev,
 	int ret;
 	bool cell_added = false;
 
-	priv = kmalloc(GFP_KERNEL, sizeof(struct lpc_ich_priv));
+	priv = kmalloc(sizeof(struct lpc_ich_priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
-- 
1.7.10.4

