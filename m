From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 13 Apr 2020 15:40:43 +0000
Subject: [PATCH] spi: sc18is602: Fix a typo in MODULE_DESCRIPTION
Message-Id: <20200413154043.23064-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: broonie@kernel.org
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

This should be 'SC18IS602', not 'SC18IC602'

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/spi/spi-sc18is602.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-sc18is602.c b/drivers/spi/spi-sc18is602.c
index 5497eeb3bf3e..ee0f3edf49cd 100644
--- a/drivers/spi/spi-sc18is602.c
+++ b/drivers/spi/spi-sc18is602.c
@@ -345,6 +345,6 @@ static struct i2c_driver sc18is602_driver = {
 
 module_i2c_driver(sc18is602_driver);
 
-MODULE_DESCRIPTION("SC18IC602/603 SPI Master Driver");
+MODULE_DESCRIPTION("SC18IS602/603 SPI Master Driver");
 MODULE_AUTHOR("Guenter Roeck");
 MODULE_LICENSE("GPL");
-- 
2.20.1
