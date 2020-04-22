From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Apr 2020 09:38:11 +0000
Subject: [PATCH] iio: imu: st_lsm6dsx: unlock on error in st_lsm6dsx_shub_write_raw()
Message-Id: <20200422093811.GA196034@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to release a lock if st_lsm6dsx_check_odr() fails, we can't
return directly.

Fixes: 76551a3c3df1 ("iio: imu: st_lsm6dsx: specify slave odr in slv_odr")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c
index 64ef07a30726..1cf98195f84d 100644
--- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c
+++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c
@@ -544,8 +544,10 @@ st_lsm6dsx_shub_write_raw(struct iio_dev *iio_dev,
 
 			ref_sensor = iio_priv(hw->iio_devs[ST_LSM6DSX_ID_ACC]);
 			odr = st_lsm6dsx_check_odr(ref_sensor, val, &odr_val);
-			if (odr < 0)
-				return odr;
+			if (odr < 0) {
+				err = odr;
+				goto release;
+			}
 
 			sensor->ext_info.slv_odr = val;
 			sensor->odr = odr;
@@ -557,6 +559,7 @@ st_lsm6dsx_shub_write_raw(struct iio_dev *iio_dev,
 		break;
 	}
 
+release:
 	iio_device_release_direct_mode(iio_dev);
 
 	return err;
-- 
2.26.1
