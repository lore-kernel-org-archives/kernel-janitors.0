From: Dan Carpenter <error27@gmail.com>
Date: Tue, 16 Mar 2010 10:03:49 +0000
Subject: [patch] iio: test for failed allocation
Message-Id: <20100316100349.GA4219@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Jonathan Cameron <jic23@cam.ac.uk>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We should return test to see if iio_allocate_trigger() fails and return -ENOMEM.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/iio/accel/lis3l02dq_ring.c b/drivers/staging/iio/accel/lis3l02dq_ring.c
index a6b7c72..db3270f 100644
--- a/drivers/staging/iio/accel/lis3l02dq_ring.c
+++ b/drivers/staging/iio/accel/lis3l02dq_ring.c
@@ -492,6 +492,9 @@ int lis3l02dq_probe_trigger(struct iio_dev *indio_dev)
 	struct lis3l02dq_state *state = indio_dev->dev_data;
 
 	state->trig = iio_allocate_trigger();
+	if (!state->trig)
+		return -ENOMEM;
+
 	state->trig->name = kmalloc(IIO_TRIGGER_NAME_LENGTH, GFP_KERNEL);
 	if (!state->trig->name) {
 		ret = -ENOMEM;
