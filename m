From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 03 Apr 2015 08:45:27 +0000
Subject: [patch] spi: signedness bug in qspi_trigger_transfer_out_int()
Message-Id: <20150403084527.GA27292@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hiep Cao Minh <cm-hiep-HEF513clHfp3+QwDJ9on6Q@public.gmane.org>
Cc: linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

We need "ret" to be unsigned for the error handling to work.  The
signedness of "i" and "n" don't matter but qspi_set_send_trigger()
returns an int so I've changed them to int as well.

Fixes: 4b6fe3edcbba ('spi: Using Trigger number to transmit/receive data')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/spi/spi-rspi.c b/drivers/spi/spi-rspi.c
index b3871d8..f6bac9e 100644
--- a/drivers/spi/spi-rspi.c
+++ b/drivers/spi/spi-rspi.c
@@ -727,7 +727,7 @@ static int rspi_rz_transfer_one(struct spi_master *master,
 static int qspi_trigger_transfer_out_int(struct rspi_data *rspi, const u8 *tx,
 					u8 *rx, unsigned int len)
 {
-	unsigned int i, n, ret;
+	int i, n, ret;
 	int error;
 
 	while (len > 0) {
