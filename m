From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 14:45:41 +0000
Subject: [PATCH] spear13xx_pcie_gadget: Delete an error message for a failed memory allocation in spear_pcie_
Message-Id: <4890202a-cb60-bcba-781d-4823f3e58b0a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 15:35:14 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/spear13xx_pcie_gadget.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/misc/spear13xx_pcie_gadget.c b/drivers/misc/spear13xx_pcie_gadget.c
index ee120dcbb3e6..75d5ecb2961b 100644
--- a/drivers/misc/spear13xx_pcie_gadget.c
+++ b/drivers/misc/spear13xx_pcie_gadget.c
@@ -671,10 +671,8 @@ static int spear_pcie_gadget_probe(struct platform_device *pdev)
 	struct configfs_subsystem *subsys;
 
 	target = devm_kzalloc(&pdev->dev, sizeof(*target), GFP_KERNEL);
-	if (!target) {
-		dev_err(&pdev->dev, "out of memory\n");
+	if (!target)
 		return -ENOMEM;
-	}
 
 	cg_item = &target->subsys.su_group.cg_item;
 	sprintf(cg_item->ci_namebuf, "pcie_gadget.%d", pdev->id);
-- 
2.15.1

