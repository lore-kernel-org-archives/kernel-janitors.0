From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 May 2017 16:42:58 +0000
Subject: [PATCH] MIPS: Alchemy: Delete an error message for a failed memory allocation in alchemy_pci_probe()
Message-Id: <6ebb5193-239f-5c34-c5f6-2be8a2fa79a5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-mips@linux-mips.org, Paul Burton <paul.burton@imgtec.com>, =?UTF-8?Q?Ralf_B=c3=a4chle?= <ralf@linux-mips.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 May 2017 18:32:21 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/mips/pci/pci-alchemy.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/pci/pci-alchemy.c b/arch/mips/pci/pci-alchemy.c
index e99ca7702d8a..a58c3290bd4e 100644
--- a/arch/mips/pci/pci-alchemy.c
+++ b/arch/mips/pci/pci-alchemy.c
@@ -377,7 +377,6 @@ static int alchemy_pci_probe(struct platform_device *pdev)
 
 	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx) {
-		dev_err(&pdev->dev, "no memory for pcictl context\n");
 		ret = -ENOMEM;
 		goto out;
 	}
-- 
2.13.0

