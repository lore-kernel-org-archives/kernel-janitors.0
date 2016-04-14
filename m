From: Slawomir Stepien <sst@poczta.fm>
Date: Thu, 14 Apr 2016 19:36:38 +0000
Subject: [PATCH 06/10] iio: adc: ad799x: remove space before comma
Message-Id: <1460662602-2951-7-git-send-email-sst@poczta.fm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1460662602-2951-1-git-send-email-sst@poczta.fm>
In-Reply-To: <1460662602-2951-1-git-send-email-sst@poczta.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jic23@kernel.org, knaack.h@gmx.de, pmeerw@pmeerw.net
Cc: linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org, Slawomir Stepien <sst@poczta.fm>

This fixes the error reported by checkpatch.pl:

ERROR: space prohibited before that ',' (ctx:WxW)

Signed-off-by: Slawomir Stepien <sst@poczta.fm>
---
 drivers/iio/adc/ad799x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ad799x.c b/drivers/iio/adc/ad799x.c
index 01d7158..a3f5254 100644
--- a/drivers/iio/adc/ad799x.c
+++ b/drivers/iio/adc/ad799x.c
@@ -477,7 +477,7 @@ static int ad799x_read_event_value(struct iio_dev *indio_dev,
 	if (ret < 0)
 		return ret;
 	*val = (ret >> chan->scan_type.shift) &
-		GENMASK(chan->scan_type.realbits - 1 , 0);
+		GENMASK(chan->scan_type.realbits - 1, 0);
 
 	return IIO_VAL_INT;
 }
-- 
2.8.0

