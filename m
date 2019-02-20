From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 20 Feb 2019 09:34:58 +0000
Subject: [PATCH -next] hwrng: make symbol 'optee_rng_id_table' static
Message-Id: <20190220093458.159208-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sumit Garg <sumit.garg@linaro.org>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

drivers/char/hw_random/optee-rng.c:265:35: warning:
 symbol 'optee_rng_id_table' was not declared. Should it be static?

Fixes: 5fe8b1cc6a03 ("hwrng: add OP-TEE based rng driver")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/char/hw_random/optee-rng.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/optee-rng.c b/drivers/char/hw_random/optee-rng.c
index 2b9fc8ac5500..3a4dd6fc9ff4 100644
--- a/drivers/char/hw_random/optee-rng.c
+++ b/drivers/char/hw_random/optee-rng.c
@@ -262,7 +262,7 @@ static int optee_rng_remove(struct device *dev)
 	return 0;
 }
 
-const struct tee_client_device_id optee_rng_id_table[] = {
+static const struct tee_client_device_id optee_rng_id_table[] = {
 	{UUID_INIT(0xab7a617c, 0xb8e7, 0x4d8f,
 		   0x83, 0x01, 0xd0, 0x9b, 0x61, 0x03, 0x6b, 0x64)},
 	{}
