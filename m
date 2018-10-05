From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 05 Oct 2018 06:19:12 +0000
Subject: [PATCH -next] eeprom: at25: remove unneeded 'at25_remove'
Message-Id: <1538720352-85691-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Devang Panchal <devang.panchal@softnautics.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/misc/eeprom/at25.c: In function 'at25_remove':
drivers/misc/eeprom/at25.c:384:20: warning:
 variable 'at25' set but not used [-Wunused-but-set-variable]

Since commit 96d08fb43e30 ("eeprom: at25: use devm_nvmem_register()"),
at25_remove is do nothing, so can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/misc/eeprom/at25.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/misc/eeprom/at25.c b/drivers/misc/eeprom/at25.c
index d874df7..99de693 100644
--- a/drivers/misc/eeprom/at25.c
+++ b/drivers/misc/eeprom/at25.c
@@ -379,15 +379,6 @@ static int at25_probe(struct spi_device *spi)
 	return 0;
 }
 
-static int at25_remove(struct spi_device *spi)
-{
-	struct at25_data	*at25;
-
-	at25 = spi_get_drvdata(spi);
-
-	return 0;
-}
-
 /*-------------------------------------------------------------------------*/
 
 static const struct of_device_id at25_of_match[] = {
@@ -402,7 +393,6 @@ static int at25_remove(struct spi_device *spi)
 		.of_match_table = at25_of_match,
 	},
 	.probe		= at25_probe,
-	.remove		= at25_remove,
 };
 
 module_spi_driver(at25_driver);
