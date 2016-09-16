From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 16 Sep 2016 10:55:24 +0000
Subject: [PATCH 1/3] iio: common: ssp_sensors: accel: constify iio_info structures
Message-Id: <1474023326-24645-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1474023326-24645-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1474023326-24645-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Cameron <jic23@kernel.org>
Cc: kernel-janitors@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org

Check for iio_info structures that are only stored in the info field of a
iio_dev structure.  This field is declared const, so iio_info structures
that have this property can be declared as const also.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r disable optional_qualifier@
identifier i;
position p;
@@
static struct iio_info i@p = { ... };

@ok@
identifier r.i;
struct iio_dev e;
position p;
@@
e.info = &i@p;

@bad@
position p != {r.p,ok.p};
identifier r.i;
struct iio_info e;
@@
e@i@p

@depends on !bad disable optional_qualifier@
identifier r.i;
@@
static
+const
 struct iio_info i = { ... };
// </smpl>

The result of size on this file before the change is:
   text	      data     bss     dec         hex	  filename
   1265        344       0    1609         649
   drivers/iio/accel/ssp_accel_sensor.o

and after the change it is:
   text	     data        bss	    dec	    hex	filename
   1425	      192          0       1617     651
   drivers/iio/accel/ssp_accel_sensor.o

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/iio/accel/ssp_accel_sensor.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/accel/ssp_accel_sensor.c b/drivers/iio/accel/ssp_accel_sensor.c
index 4ae05fc..31db009 100644
--- a/drivers/iio/accel/ssp_accel_sensor.c
+++ b/drivers/iio/accel/ssp_accel_sensor.c
@@ -74,7 +74,7 @@ static int ssp_accel_write_raw(struct iio_dev *indio_dev,
 	return -EINVAL;
 }
 
-static struct iio_info ssp_accel_iio_info = {
+static const struct iio_info ssp_accel_iio_info = {
 	.read_raw = &ssp_accel_read_raw,
 	.write_raw = &ssp_accel_write_raw,
 };

