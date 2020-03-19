From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 19 Mar 2020 12:12:00 +0000
Subject: [PATCH net-next] net: ipa: Remove unused including <linux/version.h>
Message-Id: <20200319121200.31214-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Elder <elder@kernel.org>, "David S . Miller" <davem@davemloft.net>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove including <linux/version.h> that don't need it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ipa/ipa_endpoint.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ipa/ipa_endpoint.c b/drivers/net/ipa/ipa_endpoint.c
index 915b4cd05dd2..217cbf337ad7 100644
--- a/drivers/net/ipa/ipa_endpoint.c
+++ b/drivers/net/ipa/ipa_endpoint.c
@@ -9,7 +9,6 @@
 #include <linux/slab.h>
 #include <linux/bitfield.h>
 #include <linux/if_rmnet.h>
-#include <linux/version.h>
 #include <linux/dma-direction.h>
 
 #include "gsi.h"
