From: Colin King <colin.king@canonical.com>
Date: Thu, 12 Apr 2018 14:57:56 +0000
Subject: [PATCH][next] staging: ks7010: fix null pointer dereference on priv on error exit
Message-Id: <20180412145756.24949-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Tobin C . Harding" <me@tobin.cc>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Quytelda Kahja <quytelda@tamalin.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

In the case where the call to dev_alloc_name fails the current exit
path is via err_free_netdev and this calls free_netdev on a null priv
pointer, hence causing a null pointer dereference.  Fix this by instead
exiting via err_release_irq.

Detected by CoverityScan, CID#1467844 ("Explitic null dereferenced")

Fixes: 13a9930d15b4 ("staging: ks7010: add driver from Nanonote extra-repository")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/ks7010/ks7010_sdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/ks7010/ks7010_sdio.c b/drivers/staging/ks7010/ks7010_sdio.c
index b8f55a11ee1c..cb0e11d79e32 100644
--- a/drivers/staging/ks7010/ks7010_sdio.c
+++ b/drivers/staging/ks7010/ks7010_sdio.c
@@ -895,7 +895,7 @@ static int ks7010_sdio_probe(struct sdio_func *func,
 		netdev_err(priv->net_dev,
 			   "ks7010: firmware load failed !! return code = %d\n",
 			   ret);
-		goto err_free_netdev;
+		goto err_release_irq;
 	}
 
 	/* interrupt setting */
-- 
2.17.0

