From: Colin King <colin.king@canonical.com>
Date: Wed, 25 Sep 2019 12:32:53 +0000
Subject: [PATCH] iio: gyro: clean up indentation issue
Message-Id: <20190925123253.11944-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a return statement that is indented incorrectly, add in
the missing tab.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/iio/gyro/itg3200_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/gyro/itg3200_core.c b/drivers/iio/gyro/itg3200_core.c
index 998fb8d66fe3..981ae2291505 100644
--- a/drivers/iio/gyro/itg3200_core.c
+++ b/drivers/iio/gyro/itg3200_core.c
@@ -154,7 +154,7 @@ static int itg3200_write_raw(struct iio_dev *indio_dev,
 					  t);
 
 		mutex_unlock(&indio_dev->mlock);
-	return ret;
+		return ret;
 
 	default:
 		return -EINVAL;
-- 
2.20.1
