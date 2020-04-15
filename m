From: Colin King <colin.king@canonical.com>
Date: Wed, 15 Apr 2020 23:03:58 +0000
Subject: [PATCH] crypto: algif_rng: remove redundant assignment to variable err
Message-Id: <20200415230358.1566912-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable err is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 crypto/algif_rng.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/algif_rng.c b/crypto/algif_rng.c
index 22df3799a17b..087c0ad09d38 100644
--- a/crypto/algif_rng.c
+++ b/crypto/algif_rng.c
@@ -61,7 +61,7 @@ static int rng_recvmsg(struct socket *sock, struct msghdr *msg, size_t len,
 	struct sock *sk = sock->sk;
 	struct alg_sock *ask = alg_sk(sk);
 	struct rng_ctx *ctx = ask->private;
-	int err = -EFAULT;
+	int err;
 	int genlen = 0;
 	u8 result[MAXSIZE];
 
-- 
2.25.1
