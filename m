From: JieunKim <jieun.kim4758@gmail.com>
Date: Mon, 27 Jan 2020 12:03:59 +0000
Subject: [PATCH] iio: imu: st_lsm6dsx: Fix mismatched comments
Message-Id: <20200127120359.3955-1-jieun.kim4758@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lorenzo.bianconi83@gmail.com
Cc: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, JieunKim <jieun.kim4758@gmail.com>

odr to odr_table
gain to fs_table

'gain' is actually in 'st_lsm6dsx_fs' structure of 'fs_table'

Signed-off-by: JieunKim <jieun.kim4758@gmail.com>
---
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h
index 9c3486a8134f..f2113a63721a 100644
--- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h
+++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h
@@ -230,8 +230,8 @@ enum st_lsm6dsx_ext_sensor_id {
  * @i2c_addr: I2c slave address list.
  * @wai: Wai address info.
  * @id: external sensor id.
- * @odr: Output data rate of the sensor [Hz].
- * @gain: Configured sensor sensitivity.
+ * @odr_table: Output data rate of the sensor [Hz].
+ * @fs_table: Configured sensor sensitivity table depending on full scale.
  * @temp_comp: Temperature compensation register info (addr + mask).
  * @pwr_table: Power on register info (addr + mask).
  * @off_canc: Offset cancellation register info (addr + mask).
-- 
2.17.1
