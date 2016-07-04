From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 04 Jul 2016 07:47:48 +0000
Subject: [patch] spi: s3c64xx: indent an if statement
Message-Id: <20160704074748.GB4849@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kukjin Kim <kgene@kernel.org>, Andi Shyti <andi.shyti@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mark Brown <broonie@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org, kernel-janitors@vger.kernel.org

It generates a static checker warning if an if statement isn't indented.
I think the code is fine except for the white space issue.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 6d8486f..9f0119f 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -330,8 +330,8 @@ static void s3c64xx_spi_set_cs(struct spi_device *spi, bool enable)
 		}
 	} else {
 		if (!(sdd->port_conf->quirks & S3C64XX_SPI_QUIRK_CS_AUTO))
-		writel(S3C64XX_SPI_SLAVE_SIG_INACT,
-		sdd->regs + S3C64XX_SPI_SLAVE_SEL);
+			writel(S3C64XX_SPI_SLAVE_SIG_INACT,
+			       sdd->regs + S3C64XX_SPI_SLAVE_SEL);
 	}
 }
 
