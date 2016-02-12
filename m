From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 12 Feb 2016 06:38:33 +0000
Subject: [patch] spi: checking for NULL instead of IS_ERR
Message-Id: <20160212063833.GB22756@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
Cc: linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

spi_replace_transfers() returns error pointers on error, it never
returns NULL.

Fixes: d9f121227281 ('spi: core: add spi_split_transfers_maxsize')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 1413a6b..d459adc 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -2284,8 +2284,8 @@ int __spi_split_transfer_maxsize(struct spi_master *master,
 
 	/* create replacement */
 	srt = spi_replace_transfers(msg, xfer, 1, count, NULL, 0, gfp);
-	if (!srt)
-		return -ENOMEM;
+	if (IS_ERR(srt))
+		return PTR_ERR(srt);
 	xfers = srt->inserted_transfers;
 
 	/* now handle each of those newly inserted spi_transfers
