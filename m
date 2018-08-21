From: Yue Haibing <yuehaibing@huawei.com>
Date: Tue, 21 Aug 2018 13:59:09 +0000
Subject: [PATCH] rds: tcp: remove duplicated include from tcp.c
Message-Id: <1534860342-171157-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Santosh Shilimkar <santosh.shilimkar@oracle.com>, "David S. Miller" <davem@davemloft.net>
Cc: Yue Haibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, rds-devel@oss.oracle.com, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 net/rds/tcp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/rds/tcp.c b/net/rds/tcp.c
index 2c7b7c3..b9bbcf3 100644
--- a/net/rds/tcp.c
+++ b/net/rds/tcp.c
@@ -37,7 +37,6 @@
 #include <net/tcp.h>
 #include <net/net_namespace.h>
 #include <net/netns/generic.h>
-#include <net/tcp.h>
 #include <net/addrconf.h>
 
 #include "rds.h"
