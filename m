From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 12 Dec 2019 09:15:27 +0000
Subject: [PATCH net-next] net: Remove unused including <linux/version.h>
Message-Id: <20191212091527.35293-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Jason A . Donenfeld" <Jason@zx2c4.com>, "David S . Miller" <davem@davemloft.net>
Cc: YueHaibing <yuehaibing@huawei.com>, wireguard@lists.zx2c4.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove including <linux/version.h> that don't need it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/wireguard/main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireguard/main.c b/drivers/net/wireguard/main.c
index 10c0a40f6a9e..7a7d5f1a80fc 100644
--- a/drivers/net/wireguard/main.c
+++ b/drivers/net/wireguard/main.c
@@ -12,7 +12,6 @@
 
 #include <uapi/linux/wireguard.h>
 
-#include <linux/version.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/genetlink.h>
