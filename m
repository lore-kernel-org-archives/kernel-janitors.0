From: Colin King <colin.king@canonical.com>
Date: Sat, 10 Oct 2020 16:47:36 +0000
Subject: [PATCH] crypto: inside-secure: Fix sizeof() mismatch
Message-Id: <20201010164736.12871-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antoine Tenart <atenart@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, Ofer Heifetz <oferh@marvell.com>, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

An incorrect sizeof() is being used, sizeof(priv->ring[i].rdr_req) is
not correct, it should be sizeof(*priv->ring[i].rdr_req). Note that
since the size of ** is the same size as * this is not causing any
issues.

Addresses-Coverity: ("Sizeof not portable (SIZEOF_MISMATCH)")
Fixes: 9744fec95f06 ("crypto: inside-secure - remove request list to improve performance")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/crypto/inside-secure/safexcel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/inside-secure/safexcel.c b/drivers/crypto/inside-secure/safexcel.c
index eb2418450f12..2e1562108a85 100644
--- a/drivers/crypto/inside-secure/safexcel.c
+++ b/drivers/crypto/inside-secure/safexcel.c
@@ -1639,7 +1639,7 @@ static int safexcel_probe_generic(void *pdev,
 
 		priv->ring[i].rdr_req = devm_kcalloc(dev,
 			EIP197_DEFAULT_RING_SIZE,
-			sizeof(priv->ring[i].rdr_req),
+			sizeof(*priv->ring[i].rdr_req),
 			GFP_KERNEL);
 		if (!priv->ring[i].rdr_req)
 			return -ENOMEM;
-- 
2.27.0
