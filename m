From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 29 Oct 2011 07:20:42 +0000
Subject: [patch] Staging: iio/dac/ad5064.c: signedness bug in
Message-Id: <20111029072042.GC17780@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@cam.ac.uk>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org

regulator_get_voltage() returns an int so "scale_uv" should be an
int.  Making it unsigned here breaks the error handling.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/iio/dac/ad5064.c b/drivers/staging/iio/dac/ad5064.c
index 24279f2..3b14526 100644
--- a/drivers/staging/iio/dac/ad5064.c
+++ b/drivers/staging/iio/dac/ad5064.c
@@ -280,8 +280,8 @@ static int ad5064_read_raw(struct iio_dev *indio_dev,
 			   long m)
 {
 	struct ad5064_state *st = iio_priv(indio_dev);
-	unsigned long scale_uv;
 	unsigned int vref;
+	int scale_uv;
 
 	switch (m) {
 	case 0:
