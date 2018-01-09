From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 09 Jan 2018 18:28:36 +0000
Subject: [PATCH 1/5] misc/pti: Delete an error message for a failed memory allocation in two functions
Message-Id: <0711078d-249c-3f1d-edaa-877d48de2ea7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <bd359852-a809-280d-3d52-89216edc2058@users.sourceforge.net>
In-Reply-To: <bd359852-a809-280d-3d52-89216edc2058@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 9 Jan 2018 18:00:15 +0100

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/pti.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/misc/pti.c b/drivers/misc/pti.c
index 41f2a9f6851d..92a1a20839c8 100644
--- a/drivers/misc/pti.c
+++ b/drivers/misc/pti.c
@@ -619,11 +619,8 @@ static ssize_t pti_char_write(struct file *filp, const char __user *data,
 	mc = filp->private_data;
 
 	kbuf = kmalloc(size, GFP_KERNEL);
-	if (kbuf = NULL)  {
-		pr_err("%s(%d): buf allocation failed\n",
-			__func__, __LINE__);
+	if (!kbuf)
 		return -ENOMEM;
-	}
 
 	do {
 		if (len - n > USER_COPY_SIZE)
@@ -826,9 +823,6 @@ static int pti_pci_probe(struct pci_dev *pdev,
 	drv_data = kzalloc(sizeof(*drv_data), GFP_KERNEL);
 	if (drv_data = NULL) {
 		retval = -ENOMEM;
-		dev_err(&pdev->dev,
-			"%s(%d): kmalloc() returned NULL memory.\n",
-			__func__, __LINE__);
 		goto err_disable_pci;
 	}
 	drv_data->pti_addr = pci_resource_start(pdev, pci_bar);
-- 
2.15.1

