From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 Jan 2018 16:17:54 +0000
Subject: [PATCH 3/4] misc/ioc4: Improve a size determination in ioc4_probe()
Message-Id: <85565afd-5995-83d3-0e7e-3441eeb298c3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4fb26753-2ae3-7c17-7777-03c6923a1d4b@users.sourceforge.net>
In-Reply-To: <4fb26753-2ae3-7c17-7777-03c6923a1d4b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Brent Casavant <bcasavan@sgi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jeremy Higdon <jeremy@sgi.com>, Pat Gefre <pfg@sgi.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 Jan 2018 16:18:52 +0100

Replace the specification of a data structure by a pointer dereference
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/ioc4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/ioc4.c b/drivers/misc/ioc4.c
index 5bd422498fff..704e13382df0 100644
--- a/drivers/misc/ioc4.c
+++ b/drivers/misc/ioc4.c
@@ -295,7 +295,7 @@ ioc4_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 	pci_set_master(pdev);
 
 	/* Set up per-IOC4 data */
-	idd = kmalloc(sizeof(struct ioc4_driver_data), GFP_KERNEL);
+	idd = kmalloc(sizeof(*idd), GFP_KERNEL);
 	if (!idd) {
 		ret = -ENOMEM;
 		goto out_idd;
-- 
2.15.1

