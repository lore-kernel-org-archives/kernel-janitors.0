From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 Nov 2016 11:11:00 +0000
Subject: [patch] s390/crypto: unlock on error in prng_tdes_read()
Message-Id: <20161118105451.GA26523@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Herbert Xu <herbert@gondor.apana.org.au>, Harald Freudenberger <freude@linux.vnet.ibm.com>
Cc: "David S. Miller" <davem@davemloft.net>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-crypto@vger.kernel.org, linux-s390@vger.kernel.org, kernel-janitors@vger.kernel.org

We added some new locking but forgot to unlock on error.

Fixes: 57127645d79d ("s390/zcrypt: Introduce new SHA-512 based Pseudo Random Generator.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/s390/crypto/prng.c b/arch/s390/crypto/prng.c
index 9cc050f..1113389 100644
--- a/arch/s390/crypto/prng.c
+++ b/arch/s390/crypto/prng.c
@@ -507,8 +507,10 @@ static ssize_t prng_tdes_read(struct file *file, char __user *ubuf,
 		prng_data->prngws.byte_counter += n;
 		prng_data->prngws.reseed_counter += n;
 
-		if (copy_to_user(ubuf, prng_data->buf, chunk))
-			return -EFAULT;
+		if (copy_to_user(ubuf, prng_data->buf, chunk)) {
+			ret = -EFAULT;
+			break;
+		}
 
 		nbytes -= chunk;
 		ret += chunk;
