From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 07 Aug 2017 13:03:49 +0000
Subject: [PATCH 4/5] block-skd: Fix a typo in a comment line in skd_do_inq_page_da()
Message-Id: <01b19125-e167-47f7-4e32-968849fd8712@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <56b55301-2db3-9c0b-297f-c2115fd92c6c@users.sourceforge.net>
In-Reply-To: <56b55301-2db3-9c0b-297f-c2115fd92c6c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, Geliang Tang <geliangtang@gmail.com>, Jens Axboe <axboe@kernel.dk>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 7 Aug 2017 14:18:50 +0200

Add a missing character in this description.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/block/skd_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/skd_main.c b/drivers/block/skd_main.c
index 8e2c89069927..e53b40341834 100644
--- a/drivers/block/skd_main.c
+++ b/drivers/block/skd_main.c
@@ -2556,7 +2556,7 @@ static void skd_do_inq_page_da(struct skd_device *skdev,
 	pci_read_config_word(pdev, PCI_SUBSYSTEM_ID, &val);
 	inq.pcie_subsystem_device_id = cpu_to_be16(val);
 
-	/* Driver version, fixed lenth, padded with spaces on the right */
+	/* Driver version, fixed length, padded with spaces on the right */
 	inq.driver_version_length = sizeof(inq.driver_version);
 	memset(&inq.driver_version, ' ', sizeof(inq.driver_version));
 	memcpy(inq.driver_version, DRV_VER_COMPL,
-- 
2.13.4

