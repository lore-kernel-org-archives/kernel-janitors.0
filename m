From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 29 Jun 2010 10:15:01 +0000
Subject: [PATCH 02/25] n2-drv: remove casts from void*
Message-Id: <1277806502-30772-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.hengli.com.au>, Grant Likely <grant.likely@secretlab.ca>, Sean MacLennan <smaclennan@pikatech.com>, Jiri Kosina <jkosina@suse.cz>, Daniel Mack <daniel@caiaq.de>, linux-kernel@vger.kernel.org

Remove unnesessary casts from void*.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/char/hw_random/n2-drv.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/char/hw_random/n2-drv.c b/drivers/char/hw_random/n2-drv.c
index 0f9cbf1..101d5f2 100644
--- a/drivers/char/hw_random/n2-drv.c
+++ b/drivers/char/hw_random/n2-drv.c
@@ -387,7 +387,7 @@ static int n2rng_init_control(struct n2rng *np)
 
 static int n2rng_data_read(struct hwrng *rng, u32 *data)
 {
-	struct n2rng *np = (struct n2rng *) rng->priv;
+	struct n2rng *np = rng->priv;
 	unsigned long ra = __pa(&np->test_data);
 	int len;
 
-- 
1.7.0.4

