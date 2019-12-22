From: Colin King <colin.king@canonical.com>
Date: Sun, 22 Dec 2019 22:22:24 +0000
Subject: [PATCH] misc: pti: remove redundant assignments to retval
Message-Id: <20191222222224.732340-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable retval is assigned with a value that is never read and
it is re-assigned a new value later on.  The assignment is redundant
and can be removed.  Clean up multiple occurrances of this pattern.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/misc/pti.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/pti.c b/drivers/misc/pti.c
index 063e4419cd7e..b7f510676cd6 100644
--- a/drivers/misc/pti.c
+++ b/drivers/misc/pti.c
@@ -792,7 +792,7 @@ static int pti_pci_probe(struct pci_dev *pdev,
 		const struct pci_device_id *ent)
 {
 	unsigned int a;
-	int retval = -EINVAL;
+	int retval;
 	int pci_bar = 1;
 
 	dev_dbg(&pdev->dev, "%s %s(%d): PTI PCI ID %04x:%04x\n", __FILE__,
@@ -910,7 +910,7 @@ static struct pci_driver pti_pci_driver = {
  */
 static int __init pti_init(void)
 {
-	int retval = -EINVAL;
+	int retval;
 
 	/* First register module as tty device */
 
-- 
2.24.0
