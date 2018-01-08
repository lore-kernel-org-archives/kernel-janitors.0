From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 Jan 2018 13:09:32 +0000
Subject: [PATCH 2/3] misc/ibmasm: Improve a size determination in ibmasm_init_one()
Message-Id: <bda74202-f96e-9117-87cf-75f080d87123@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <842e4179-dbac-cd43-e320-c5009d896a28@users.sourceforge.net>
In-Reply-To: <842e4179-dbac-cd43-e320-c5009d896a28@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, Anton Vasilyev <vasilyev@ispras.ru>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Kosina <jkosina@suse.cz>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 Jan 2018 13:43:20 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/ibmasm/module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/ibmasm/module.c b/drivers/misc/ibmasm/module.c
index d22b3c428ca9..894397b1ee51 100644
--- a/drivers/misc/ibmasm/module.c
+++ b/drivers/misc/ibmasm/module.c
@@ -78,7 +78,7 @@ static int ibmasm_init_one(struct pci_dev *pdev, const struct pci_device_id *id)
 	/* vnc client won't work without bus-mastering */
 	pci_set_master(pdev);
 
-	sp = kzalloc(sizeof(struct service_processor), GFP_KERNEL);
+	sp = kzalloc(sizeof(*sp), GFP_KERNEL);
 	if (sp = NULL) {
 		result = -ENOMEM;
 		goto error_kmalloc;
-- 
2.15.1

