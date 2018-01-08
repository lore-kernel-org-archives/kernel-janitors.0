From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 Jan 2018 16:19:10 +0000
Subject: [PATCH 4/4] misc/ioc4: Adjust one function call together with a variable assignment
Message-Id: <f51d4d70-6c21-229e-fdc6-8c4032bb974d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4fb26753-2ae3-7c17-7777-03c6923a1d4b@users.sourceforge.net>
In-Reply-To: <4fb26753-2ae3-7c17-7777-03c6923a1d4b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Brent Casavant <bcasavan@sgi.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jeremy Higdon <jeremy@sgi.com>, Pat Gefre <pfg@sgi.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 Jan 2018 16:43:21 +0100

The script "checkpatch.pl" pointed information out like the following.

ERROR: do not use assignment in if condition

Thus fix the affected source code place.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/ioc4.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/ioc4.c b/drivers/misc/ioc4.c
index 704e13382df0..8381dd9c7dd9 100644
--- a/drivers/misc/ioc4.c
+++ b/drivers/misc/ioc4.c
@@ -283,10 +283,11 @@ ioc4_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 	struct ioc4_driver_data *idd;
 	struct ioc4_submodule *is;
 	uint32_t pcmd;
-	int ret;
 
 	/* Enable IOC4 and take ownership of it */
-	if ((ret = pci_enable_device(pdev))) {
+	int ret = pci_enable_device(pdev);
+
+	if (ret) {
 		printk(KERN_WARNING
 		       "%s: Failed to enable IOC4 device for pci_dev %s.\n",
 		       __func__, pci_name(pdev));
-- 
2.15.1

