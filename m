From: Colin King <colin.king@canonical.com>
Date: Wed, 10 Apr 2019 18:23:51 +0000
Subject: [PATCH][next] iio: temperature: max31856: fix uninitialized error return
Message-Id: <20190410182351.18352-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Paresh Chaudhary <paresh.chaudhary@rockwellcollins.com>, linux-iio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently if mask is neither CHAN_INFO_RAW or CHAN_INFO_SCALE then
then an uninitialized error return 'ret' is returned. Fix this by
adding a default case that ensures -EINVAL is returned for this
specific case.

Addresses-Coverity: ("Uninitialized scalar variable")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/iio/temperature/max31856.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iio/temperature/max31856.c b/drivers/iio/temperature/max31856.c
index 6b67d6b95cf9..f184ba5601d9 100644
--- a/drivers/iio/temperature/max31856.c
+++ b/drivers/iio/temperature/max31856.c
@@ -210,6 +210,9 @@ static int max31856_read_raw(struct iio_dev *indio_dev,
 			return IIO_VAL_INT_PLUS_MICRO;
 		}
 		break;
+	default:
+		ret = -EINVAL;
+		break;
 	}
 
 	return ret;
-- 
2.20.1
