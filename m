From: Colin King <colin.king@canonical.com>
Date: Wed, 17 Apr 2019 16:34:25 +0000
Subject: [PATCH] media: atmel-isc: fix spelling mistake "profie" -> "profile"
Message-Id: <20190417163425.12826-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eugen Hristev <eugen.hristev@microchip.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a v4l2_warn warning message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/platform/atmel/atmel-isc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/atmel/atmel-isc.c b/drivers/media/platform/atmel/atmel-isc.c
index 9a399aa7ca92..e3cfce05d6b6 100644
--- a/drivers/media/platform/atmel/atmel-isc.c
+++ b/drivers/media/platform/atmel/atmel-isc.c
@@ -1011,7 +1011,7 @@ static int isc_update_profile(struct isc_device *isc)
 	}
 
 	if (counter < 0) {
-		v4l2_warn(&isc->v4l2_dev, "Time out to update profie\n");
+		v4l2_warn(&isc->v4l2_dev, "Time out to update profile\n");
 		return -ETIMEDOUT;
 	}
 
-- 
2.20.1
