From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 09 Jan 2018 16:40:05 +0000
Subject: [PATCH] misc/phantom: Delete an error message for a failed memory allocation in phantom_probe()
Message-Id: <73220c52-2399-12a5-276d-9145877a5bea@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 9 Jan 2018 17:25:59 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/phantom.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/misc/phantom.c b/drivers/misc/phantom.c
index 8fa68cf308e0..ab55d2114136 100644
--- a/drivers/misc/phantom.c
+++ b/drivers/misc/phantom.c
@@ -365,10 +365,8 @@ static int phantom_probe(struct pci_dev *pdev,
 
 	retval = -ENOMEM;
 	pht = kzalloc(sizeof(*pht), GFP_KERNEL);
-	if (pht = NULL) {
-		dev_err(&pdev->dev, "unable to allocate device\n");
+	if (!pht)
 		goto err_reg;
-	}
 
 	pht->caddr = pci_iomap(pdev, 0, 0);
 	if (pht->caddr = NULL) {
-- 
2.15.1

