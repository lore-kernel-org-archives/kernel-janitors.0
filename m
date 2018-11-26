From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 26 Nov 2018 08:12:29 +0000
Subject: [PATCH] misc/pvpanic: fix a NULL vs IS_ERR() check
Message-Id: <20181126081229.zzgbambzjnbmmo7e@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Peng Hao <peng.hao2@zte.com.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The devm_ioremap_resource() function doesn't return NULL, it returns
error pointers.

Fixes: 46f934c9a12f ("misc/pvpanic: add support to get pvpanic device info FDT")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/misc/pvpanic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
index 01241ec6a5cd..595ac065b401 100644
--- a/drivers/misc/pvpanic.c
+++ b/drivers/misc/pvpanic.c
@@ -140,8 +140,8 @@ static int pvpanic_mmio_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	base = devm_ioremap_resource(&pdev->dev, mem);
-	if (base = NULL)
-		return -EFAULT;
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
 	atomic_notifier_chain_register(&panic_notifier_list,
 				       &pvpanic_panic_nb);
-- 
2.11.0
