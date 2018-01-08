From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 Jan 2018 13:08:30 +0000
Subject: [PATCH 1/3] misc/ibmasm: Delete an error message for a failed memory allocation in ibmasm_init_one()
Message-Id: <bbb0866e-73b7-ff4a-e2d4-eec9d4a8219c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <842e4179-dbac-cd43-e320-c5009d896a28@users.sourceforge.net>
In-Reply-To: <842e4179-dbac-cd43-e320-c5009d896a28@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, Anton Vasilyev <vasilyev@ispras.ru>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Kosina <jkosina@suse.cz>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 Jan 2018 13:34:55 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/ibmasm/module.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/misc/ibmasm/module.c b/drivers/misc/ibmasm/module.c
index e914b8c80943..d22b3c428ca9 100644
--- a/drivers/misc/ibmasm/module.c
+++ b/drivers/misc/ibmasm/module.c
@@ -80,7 +80,6 @@ static int ibmasm_init_one(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	sp = kzalloc(sizeof(struct service_processor), GFP_KERNEL);
 	if (sp = NULL) {
-		dev_err(&pdev->dev, "Failed to allocate memory\n");
 		result = -ENOMEM;
 		goto error_kmalloc;
 	}
-- 
2.15.1

