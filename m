From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 Jan 2014 11:58:50 +0000
Subject: [patch] iio: dac: ad7303: remove an unneeded check
Message-Id: <20140130115849.GI12734@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, Sachin Kamat <sachin.kamat@linaro.org>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

"ret" is zero here.  There is no need to check again.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/iio/dac/ad7303.c b/drivers/iio/dac/ad7303.c
index d0505fd22ef4..fa2810032968 100644
--- a/drivers/iio/dac/ad7303.c
+++ b/drivers/iio/dac/ad7303.c
@@ -92,7 +92,7 @@ static ssize_t ad7303_write_dac_powerdown(struct iio_dev *indio_dev,
 	ad7303_write(st, chan->channel, st->dac_cache[chan->channel]);
 
 	mutex_unlock(&indio_dev->mlock);
-	return ret ? ret : len;
+	return len;
 }
 
 static int ad7303_get_vref(struct ad7303_state *st,
