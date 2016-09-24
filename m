From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 24 Sep 2016 06:25:40 +0000
Subject: [PATCH 2/7] iio: Rename a jump label in iio_buffer_store_watermark()
Message-Id: <50eb1352-fb0a-1cf5-70d8-48fe8f98b9eb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <c11fbb47-1fd3-4e9e-042e-0f271cfef814@users.sourceforge.net>
In-Reply-To: <c11fbb47-1fd3-4e9e-042e-0f271cfef814@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-iio@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 24 Sep 2016 06:54:49 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/iio/industrialio-buffer.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/industrialio-buffer.c b/drivers/iio/industrialio-buffer.c
index 7a4d9499..a865af8 100644
--- a/drivers/iio/industrialio-buffer.c
+++ b/drivers/iio/industrialio-buffer.c
@@ -1028,16 +1028,16 @@ static ssize_t iio_buffer_store_watermark(struct device *dev,
 
 	if (val > buffer->length) {
 		ret = -EINVAL;
-		goto out;
+		goto unlock;
 	}
 
 	if (iio_buffer_is_active(indio_dev->buffer)) {
 		ret = -EBUSY;
-		goto out;
+		goto unlock;
 	}
 
 	buffer->watermark = val;
-out:
+unlock:
 	mutex_unlock(&indio_dev->mlock);
 
 	return ret ? ret : len;
-- 
2.10.0

