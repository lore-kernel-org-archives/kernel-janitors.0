From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 02 Sep 2017 18:41:03 +0000
Subject: [PATCH 1/3] [media] cx18: Delete an error message for a failed memory allocation in cx18_probe()
Message-Id: <a47013ab-7738-b07b-5e01-1f3435d45a43@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <016d4c9c-1d8e-e277-5d7c-f433553cf0fa@users.sourceforge.net>
In-Reply-To: <016d4c9c-1d8e-e277-5d7c-f433553cf0fa@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Andy Walls <awalls@md.metrocast.net>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 2 Sep 2017 19:39:56 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/pci/cx18/cx18-driver.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-driver.c b/drivers/media/pci/cx18/cx18-driver.c
index 8bce49cdad46..b267590e0877 100644
--- a/drivers/media/pci/cx18/cx18-driver.c
+++ b/drivers/media/pci/cx18/cx18-driver.c
@@ -913,8 +913,6 @@ static int cx18_probe(struct pci_dev *pci_dev,
-	if (cx = NULL) {
-		printk(KERN_ERR "cx18: cannot manage card %d, out of memory\n",
-		       i);
+	if (!cx)
 		return -ENOMEM;
-	}
+
 	cx->pci_dev = pci_dev;
 	cx->instance = i;
 
-- 
2.14.1

