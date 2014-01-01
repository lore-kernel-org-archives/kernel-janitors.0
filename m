From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 01 Jan 2014 12:11:37 +0000
Subject: [PATCH] staging:iio: correct error check
Message-Id: <1388581641-26782-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

iio_kfifo_allocate returns NULL in case of error.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression *x;
identifier f;
statement S1,S2;
@@

*x = f(...);
 if (x) { <+... when != if (...) S1 else S2
     -ENOMEM ...+> }
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/iio/impedance-analyzer/ad5933.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
index 0a4298b..2b96665 100644
--- a/drivers/staging/iio/impedance-analyzer/ad5933.c
+++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
@@ -629,7 +629,7 @@ static int ad5933_register_ring_funcs_and_init(struct iio_dev *indio_dev)
 	struct iio_buffer *buffer;
 
 	buffer = iio_kfifo_allocate(indio_dev);
-	if (buffer)
+	if (!buffer)
 		return -ENOMEM;
 
 	iio_device_attach_buffer(indio_dev, buffer);

