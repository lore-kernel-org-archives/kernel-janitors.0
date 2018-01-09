From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 09 Jan 2018 16:10:05 +0000
Subject: [PATCH] misc/mic/host: Delete an error message for a failed memory allocation in mic_probe()
Message-Id: <317c580a-028f-2119-efd1-3a65732a433c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Ashutosh Dixit <ashutosh.dixit@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sudeep Dutt <sudeep.dutt@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 9 Jan 2018 17:03:41 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/mic/host/mic_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/misc/mic/host/mic_main.c b/drivers/misc/mic/host/mic_main.c
index 035be3e9ceba..e3d38f6018c4 100644
--- a/drivers/misc/mic/host/mic_main.c
+++ b/drivers/misc/mic/host/mic_main.c
@@ -175,7 +175,6 @@ static int mic_probe(struct pci_dev *pdev,
 	mdev = kzalloc(sizeof(*mdev), GFP_KERNEL);
 	if (!mdev) {
 		rc = -ENOMEM;
-		dev_err(&pdev->dev, "mdev kmalloc failed rc %d\n", rc);
 		goto mdev_alloc_fail;
 	}
 	mdev->id = ida_simple_get(&g_mic_ida, 0, MIC_MAX_NUM_DEVS, GFP_KERNEL);
-- 
2.15.1

