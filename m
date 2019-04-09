From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 09 Apr 2019 02:12:17 +0000
Subject: [PATCH -next] iio: imu: st_lsm6dsx: remove set but not used variables 'acc_sensor' and 'gyro_sensor'
Message-Id: <20190409021217.155327-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1544855484-154231-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1544855484-154231-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c: In function 'st_lsm6dsx_read_tagged_fifo':
drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c:520:41: warning:
 variable 'gyro_sensor' set but not used [-Wunused-but-set-variable]

drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c:520:28: warning:
 variable 'acc_sensor' set but not used [-Wunused-but-set-variable]

They are not used since commit 14c7c6e1a860 ("iio: imu: st_lsm6dsx: add
st_lsm6dsx_push_tagged_data routine")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c
index 2da8c5ff699a..bd08711d5b75 100644
--- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c
+++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c
@@ -517,7 +517,6 @@ int st_lsm6dsx_read_tagged_fifo(struct st_lsm6dsx_hw *hw)
 {
 	u16 pattern_len = hw->sip * ST_LSM6DSX_TAGGED_SAMPLE_SIZE;
 	u16 fifo_len, fifo_diff_mask;
-	struct st_lsm6dsx_sensor *acc_sensor, *gyro_sensor;
 	u8 iio_buff[ST_LSM6DSX_IIO_BUFF_SIZE], tag;
 	bool reset_ts = false;
 	int i, err, read_len;
@@ -539,9 +538,6 @@ int st_lsm6dsx_read_tagged_fifo(struct st_lsm6dsx_hw *hw)
 	if (!fifo_len)
 		return 0;
 
-	acc_sensor = iio_priv(hw->iio_devs[ST_LSM6DSX_ID_ACC]);
-	gyro_sensor = iio_priv(hw->iio_devs[ST_LSM6DSX_ID_GYRO]);
-
 	for (read_len = 0; read_len < fifo_len; read_len += pattern_len) {
 		err = st_lsm6dsx_read_block(hw,
 					    ST_LSM6DSX_REG_FIFO_OUT_TAG_ADDR,
