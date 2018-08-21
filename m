From: Yue Haibing <yuehaibing@huawei.com>
Date: Tue, 21 Aug 2018 01:41:56 +0000
Subject: [PATCH] rhashtable: remove duplicated include from rhashtable.c
Message-Id: <1534815716-102071-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Graf <tgraf@suug.ch>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: Yue Haibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 lib/rhashtable.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/rhashtable.c b/lib/rhashtable.c
index ae4223e..672eecd 100644
--- a/lib/rhashtable.c
+++ b/lib/rhashtable.c
@@ -28,7 +28,6 @@
 #include <linux/rhashtable.h>
 #include <linux/err.h>
 #include <linux/export.h>
-#include <linux/rhashtable.h>
 
 #define HASH_DEFAULT_SIZE	64UL
 #define HASH_MIN_SIZE		4U
