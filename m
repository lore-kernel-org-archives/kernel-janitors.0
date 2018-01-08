From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 Jan 2018 16:16:48 +0000
Subject: [PATCH 2/4] misc/ioc4: Delete an error message for a failed memory allocation in ioc4_probe()
Message-Id: <e706f722-1e0b-22ff-c826-a29658771cd3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4fb26753-2ae3-7c17-7777-03c6923a1d4b@users.sourceforge.net>
In-Reply-To: <4fb26753-2ae3-7c17-7777-03c6923a1d4b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Brent Casavant <bcasavan@sgi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jeremy Higdon <jeremy@sgi.com>, Pat Gefre <pfg@sgi.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 Jan 2018 16:14:49 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/ioc4.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/misc/ioc4.c b/drivers/misc/ioc4.c
index 63a64104d2da..5bd422498fff 100644
--- a/drivers/misc/ioc4.c
+++ b/drivers/misc/ioc4.c
@@ -297,9 +297,6 @@ ioc4_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 	/* Set up per-IOC4 data */
 	idd = kmalloc(sizeof(struct ioc4_driver_data), GFP_KERNEL);
 	if (!idd) {
-		printk(KERN_WARNING
-		       "%s: Failed to allocate IOC4 data for pci_dev %s.\n",
-		       __func__, pci_name(pdev));
 		ret = -ENOMEM;
 		goto out_idd;
 	}
-- 
2.15.1

