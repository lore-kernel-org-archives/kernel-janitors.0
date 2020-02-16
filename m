From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 16 Feb 2020 10:27:42 +0000
Subject: [PATCH] tty: serial: Kconfig: Fix a typo
Message-Id: <20200216102742.19298-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, jslaby@suse.com
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'exsisting' has an extra 's'

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/tty/serial/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 52eaac21ff9f..7172f1c5fa6d 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -1111,7 +1111,7 @@ config SERIAL_SC16IS7XX_SPI
 	help
 	  Enable SC16IS7xx driver on SPI bus,
 	  If required say y, and say n to spi if not required,
-	  This is additional support to exsisting driver.
+	  This is additional support to existing driver.
 	  You must select at least one bus for the driver to be built.
 
 config SERIAL_TIMBERDALE
-- 
2.20.1
