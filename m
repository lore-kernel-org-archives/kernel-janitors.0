From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 Jan 2018 16:15:01 +0000
Subject: [PATCH 1/4] misc/ioc4: Return -ENOMEM after a failed kmalloc() in ioc4_probe()
Message-Id: <5a181819-168a-5b16-858a-7026071e0a93@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4fb26753-2ae3-7c17-7777-03c6923a1d4b@users.sourceforge.net>
In-Reply-To: <4fb26753-2ae3-7c17-7777-03c6923a1d4b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Brent Casavant <bcasavan@sgi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jeremy Higdon <jeremy@sgi.com>, Pat Gefre <pfg@sgi.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 Jan 2018 16:12:52 +0100

Replace an error code for the indication of a memory allocation failure
in this function.

Fixes: 22329b511a97557b293583194037d1f4c71e1504 ("ioc4: Core driver rewrite")

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/ioc4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/ioc4.c b/drivers/misc/ioc4.c
index ec0832278170..63a64104d2da 100644
--- a/drivers/misc/ioc4.c
+++ b/drivers/misc/ioc4.c
@@ -300,7 +300,7 @@ ioc4_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 		printk(KERN_WARNING
 		       "%s: Failed to allocate IOC4 data for pci_dev %s.\n",
 		       __func__, pci_name(pdev));
-		ret = -ENODEV;
+		ret = -ENOMEM;
 		goto out_idd;
 	}
 	idd->idd_pdev = pdev;
-- 
2.15.1

