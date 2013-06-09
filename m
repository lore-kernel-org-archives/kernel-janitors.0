From: Dan Carpenter <dan.carpenter@oracle.com>, Peter Crosthwaite <peter.crosthwaite@p
Date: Sun, 09 Jun 2013 13:07:28 +0000
Subject: [patch -next] spi: spi-xilinx: cleanup a check in xilinx_spi_txrx_bufs()
Message-Id: <20130609130728.GA1442@debian>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

'!' has higher precedence than comparisons so the original condition
is equivalent to "if (xspi->remaining_bytes = 0)".  This makes the
static checkers complain.

xspi->remaining_bytes is signed and from looking at the code
briefly, I think it might be able to go negative.  I suspect that
going negative may cause a bug, but I don't have the hardware and
can't test.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/spi/spi-xilinx.c b/drivers/spi/spi-xilinx.c
index 0b8398c..fb56fcf 100644
--- a/drivers/spi/spi-xilinx.c
+++ b/drivers/spi/spi-xilinx.c
@@ -301,7 +301,7 @@ static int xilinx_spi_txrx_bufs(struct spi_device *spi, struct spi_transfer *t)
 		}
 
 		/* See if there is more data to send */
-		if (!xspi->remaining_bytes > 0)
+		if (xspi->remaining_bytes <= 0)
 			break;
 	}
 
