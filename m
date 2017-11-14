From: Colin King <colin.king@canonical.com>
Date: Tue, 14 Nov 2017 13:33:46 +0000
Subject: [PATCH] crypto/nx: fix spelling mistake: "availavle" -> "available"
Message-Id: <20171114133346.17697-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Haren Myneni <haren@us.ibm.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in pr_err error message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/crypto/nx/nx-842-powernv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/nx/nx-842-powernv.c b/drivers/crypto/nx/nx-842-powernv.c
index f2246a5abcf6..9c01d11f255a 100644
--- a/drivers/crypto/nx/nx-842-powernv.c
+++ b/drivers/crypto/nx/nx-842-powernv.c
@@ -744,7 +744,7 @@ static int nx842_open_percpu_txwins(void)
 
 		if (!per_cpu(cpu_txwin, i)) {
 			/* shoudn't happen, Each chip will have NX engine */
-			pr_err("NX engine is not availavle for CPU %d\n", i);
+			pr_err("NX engine is not available for CPU %d\n", i);
 			return -EINVAL;
 		}
 	}
-- 
2.14.1

