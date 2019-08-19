From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Mon, 19 Aug 2019 04:48:27 +0000
Subject: [PATCH] Kconfig: Fix the reference to the RFD77402 ToF sensor in the 'help' section
Message-Id: <20190819044827.5259-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, ak@it-klinger.de, robh@kernel.org, songqiang1304521@gmail.com, tglx@linutronix.de
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

This should be RFD77402, not RFD77420.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Not sure that the Kconfig prefix is correct. I have choosen it because of
commit 21cf20a84a ("Kconfig: change configuration of srf04 ultrasonic iio sensor")
---
 drivers/iio/proximity/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/proximity/Kconfig b/drivers/iio/proximity/Kconfig
index 6b5cce6f1a7b..d53601447da4 100644
--- a/drivers/iio/proximity/Kconfig
+++ b/drivers/iio/proximity/Kconfig
@@ -62,7 +62,7 @@ config RFD77402
 	tristate "RFD77402 ToF sensor"
 	depends on I2C
 	help
-	  Say Y to build a driver for the RFD77420 Time-of-Flight (distance)
+	  Say Y to build a driver for the RFD77402 Time-of-Flight (distance)
 	  sensor module with I2C interface.
 
 	  To compile this driver as a module, choose M here: the
-- 
2.20.1
