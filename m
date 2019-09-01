From: Colin King <colin.king@canonical.com>
Date: Sun, 01 Sep 2019 15:27:49 +0000
Subject: [PATCH] iio: light: cm36651: redundant assignment to variable ret
Message-Id: <20190901152749.12916-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kevin Tsai <ktsai@capellamicro.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable ret is being assigned a value that is never read and
is being re-assigned a little later on. The assignment is redundant
and hence can be removed.

Addresses-Coverity: ("Ununsed value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/iio/light/cm36651.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/light/cm36651.c b/drivers/iio/light/cm36651.c
index 1019d625adb1..90e38fcc974b 100644
--- a/drivers/iio/light/cm36651.c
+++ b/drivers/iio/light/cm36651.c
@@ -532,7 +532,7 @@ static int cm36651_write_prox_event_config(struct iio_dev *indio_dev,
 					int state)
 {
 	struct cm36651_data *cm36651 = iio_priv(indio_dev);
-	int cmd, ret = -EINVAL;
+	int cmd, ret;
 
 	mutex_lock(&cm36651->lock);
 
-- 
2.20.1
