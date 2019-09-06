From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 06 Sep 2019 16:18:12 +0000
Subject: [PATCH] dca: Use PTR_ERR_OR_ZERO() in dca_sysfs_add_req()
Message-Id: <266c98ba-43ad-28c8-055b-a3e832e7e8a5@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Allison Randal <allison@lohutok.net>, Kate Stewart <kstewart@linuxfoundation.org>, Michael Ellerman <mpe@ellerman.id.au>, Richard Fontana <rfontana@redhat.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, zhong jiang <zhongjiang@huawei.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 6 Sep 2019 18:05:21 +0200

Simplify this function implementation by using a known function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/dca/dca-sysfs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/dca/dca-sysfs.c b/drivers/dca/dca-sysfs.c
index eb25627b059d..21ebd0af268b 100644
--- a/drivers/dca/dca-sysfs.c
+++ b/drivers/dca/dca-sysfs.c
@@ -24,9 +24,7 @@ int dca_sysfs_add_req(struct dca_provider *dca, struct device *dev, int slot)

 	cd = device_create(dca_class, dca->cd, MKDEV(0, slot + 1), NULL,
 			   "requester%d", req_count++);
-	if (IS_ERR(cd))
-		return PTR_ERR(cd);
-	return 0;
+	return PTR_ERR_OR_ZERO(cd);
 }

 void dca_sysfs_remove_req(struct dca_provider *dca, int slot)
--
2.23.0
