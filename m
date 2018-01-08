From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 Jan 2018 13:10:38 +0000
Subject: [PATCH 3/3] misc/ibmasm: Adjust two function calls together with a variable assignment
Message-Id: <6123f351-5656-2955-5cf1-953dfac61c04@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <842e4179-dbac-cd43-e320-c5009d896a28@users.sourceforge.net>
In-Reply-To: <842e4179-dbac-cd43-e320-c5009d896a28@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, Anton Vasilyev <vasilyev@ispras.ru>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Kosina <jkosina@suse.cz>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 Jan 2018 13:53:25 +0100

The script "checkpatch.pl" pointed information out like the following.

ERROR: do not use assignment in if condition

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/ibmasm/module.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/ibmasm/module.c b/drivers/misc/ibmasm/module.c
index 894397b1ee51..f4742044e0d1 100644
--- a/drivers/misc/ibmasm/module.c
+++ b/drivers/misc/ibmasm/module.c
@@ -64,14 +64,16 @@ MODULE_PARM_DESC(ibmasm_debug, " Set debug mode on or off");
 
 static int ibmasm_init_one(struct pci_dev *pdev, const struct pci_device_id *id)
 {
-	int result;
 	struct service_processor *sp;
+	int result = pci_enable_device(pdev);
 
-	if ((result = pci_enable_device(pdev))) {
+	if (result) {
 		dev_err(&pdev->dev, "Failed to enable PCI device\n");
 		return result;
 	}
-	if ((result = pci_request_regions(pdev, DRIVER_NAME))) {
+
+	result = pci_request_regions(pdev, DRIVER_NAME);
+	if (result) {
 		dev_err(&pdev->dev, "Failed to allocate PCI resources\n");
 		goto error_resources;
 	}
-- 
2.15.1

