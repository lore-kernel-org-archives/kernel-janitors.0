From: Colin King <colin.king@canonical.com>
Date: Thu, 30 Nov 2017 11:26:14 +0000
Subject: [PATCH] crypto: cryptd: make cryptd_max_cpu_qlen module parameter static
Message-Id: <20171130112614.3090-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The cryptd_max_cpu_qlen module parameter is local to the source and does
not need to be in global scope, so make it static.

Cleans up sparse warning:
crypto/cryptd.c:35:14: warning: symbol 'cryptd_max_cpu_qlen' was not
declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 crypto/cryptd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/cryptd.c b/crypto/cryptd.c
index b1eb131c0f10..552e3a86e829 100644
--- a/crypto/cryptd.c
+++ b/crypto/cryptd.c
@@ -32,7 +32,7 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 
-unsigned int cryptd_max_cpu_qlen = 1000;
+static unsigned int cryptd_max_cpu_qlen = 1000;
 module_param(cryptd_max_cpu_qlen, uint, 0);
 MODULE_PARM_DESC(cryptd_max_cpu_qlen, "Set cryptd Max queue depth");
 
-- 
2.14.1

