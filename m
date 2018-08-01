From: Colin King <colin.king@canonical.com>
Date: Wed, 01 Aug 2018 17:22:41 +0000
Subject: [PATCH] drivers: net: lmc: fix case value for target abort error
Message-Id: <20180801172241.1974-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Vasyl Gomonovych <gomonovych@gmail.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Current value for a target abort error is 0x010, however, this value
should in fact be 0x002.  As it stands, the range of error is 0..7 so
it is currently never being detected.  This bug has been in the driver
since the early 2.6.12 days (or before).

Detected by CoverityScan, CID#744290 ("Logically dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/wan/lmc/lmc_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wan/lmc/lmc_main.c b/drivers/net/wan/lmc/lmc_main.c
index 093bd21f574d..4907453f17f5 100644
--- a/drivers/net/wan/lmc/lmc_main.c
+++ b/drivers/net/wan/lmc/lmc_main.c
@@ -1362,7 +1362,7 @@ static irqreturn_t lmc_interrupt (int irq, void *dev_instance) /*fold00*/
             case 0x001:
                 printk(KERN_WARNING "%s: Master Abort (naughty)\n", dev->name);
                 break;
-            case 0x010:
+            case 0x002:
                 printk(KERN_WARNING "%s: Target Abort (not so naughty)\n", dev->name);
                 break;
             default:
-- 
2.17.1

