From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 21 Jul 2019 10:49:18 +0000
Subject: [PATCH] iio: light: apds9960: Fix a typo
Message-Id: <20190721104918.30253-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, broonie@kernel.org, dpfrey@gmail.com
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

s/ADPS9960/APDS9960/
(P and D switched)

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/iio/light/apds9960.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/light/apds9960.c b/drivers/iio/light/apds9960.c
index b09b8b60bd83..c5dfb9a6b5a1 100644
--- a/drivers/iio/light/apds9960.c
+++ b/drivers/iio/light/apds9960.c
@@ -1135,5 +1135,5 @@ static struct i2c_driver apds9960_driver = {
 module_i2c_driver(apds9960_driver);
 
 MODULE_AUTHOR("Matt Ranostay <matt.ranostay@konsulko.com>");
-MODULE_DESCRIPTION("ADPS9960 Gesture/RGB/ALS/Proximity sensor");
+MODULE_DESCRIPTION("APDS9960 Gesture/RGB/ALS/Proximity sensor");
 MODULE_LICENSE("GPL");
-- 
2.20.1
