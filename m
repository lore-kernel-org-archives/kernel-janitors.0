From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 07 Aug 2017 13:02:09 +0000
Subject: [PATCH 3/5] block-skd: Delete an unnecessary return statement in skd_pci_remove()
Message-Id: <838a198d-fcbf-ecc1-622d-fc67d1ab8e1a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <56b55301-2db3-9c0b-297f-c2115fd92c6c@users.sourceforge.net>
In-Reply-To: <56b55301-2db3-9c0b-297f-c2115fd92c6c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Geliang Tang <geliangtang@gmail.com>, Jens Axboe <axboe@kernel.dk>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 7 Aug 2017 14:10:35 +0200

The script "checkpatch.pl" pointed information out like the following.

WARNING: void function return statements are not generally useful

Thus remove such a statement in the affected function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/skd_main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/block/skd_main.c b/drivers/block/skd_main.c
index fa8569d4543b..8e2c89069927 100644
--- a/drivers/block/skd_main.c
+++ b/drivers/block/skd_main.c
@@ -4831,8 +4831,6 @@ static void skd_pci_remove(struct pci_dev *pdev)
 	pci_release_regions(pdev);
 	pci_disable_device(pdev);
 	pci_set_drvdata(pdev, NULL);
-
-	return;
 }
 
 static int skd_pci_suspend(struct pci_dev *pdev, pm_message_t state)
-- 
2.13.4

