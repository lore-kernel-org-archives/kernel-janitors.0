From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 30 Aug 2018 01:29:39 +0000
Subject: [PATCH net-next] net/ncsi: remove duplicated include from ncsi-netlink.c
Message-Id: <1535592579-59890-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>, "David S. Miller" <davem@davemloft.net>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 net/ncsi/ncsi-netlink.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/ncsi/ncsi-netlink.c b/net/ncsi/ncsi-netlink.c
index 45f33d6..32cb775 100644
--- a/net/ncsi/ncsi-netlink.c
+++ b/net/ncsi/ncsi-netlink.c
@@ -12,7 +12,6 @@
 #include <linux/if_arp.h>
 #include <linux/rtnetlink.h>
 #include <linux/etherdevice.h>
-#include <linux/module.h>
 #include <net/genetlink.h>
 #include <net/ncsi.h>
 #include <linux/skbuff.h>
