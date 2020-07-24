From: Colin King <colin.king@canonical.com>
Date: Fri, 24 Jul 2020 10:10:01 +0000
Subject: [PATCH] hwrng: core: remove redundant initialization of variable ret
Message-Id: <20200724101001.12505-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Mackall <mpm@selenic.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-crypto@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/char/hw_random/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/core.c b/drivers/char/hw_random/core.c
index d2d7a42d7e0d..8c1c47dd9f46 100644
--- a/drivers/char/hw_random/core.c
+++ b/drivers/char/hw_random/core.c
@@ -611,7 +611,7 @@ EXPORT_SYMBOL_GPL(devm_hwrng_unregister);
 
 static int __init hwrng_modinit(void)
 {
-	int ret = -ENOMEM;
+	int ret;
 
 	/* kmalloc makes this safe for virt_to_page() in virtio_rng.c */
 	rng_buffer = kmalloc(rng_buffer_size(), GFP_KERNEL);
-- 
2.27.0
