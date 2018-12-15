From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 15 Dec 2018 06:31:24 +0000
Subject: [PATCH -next] iio: imu: st_lsm6dsx: remove set but not used variable ''
Message-Id: <1544855484-154231-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-iio@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c: In function 'st_lsm6dsx_shub_read_reg':
drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c:108:41: warning:
 variable 'hub_settings' set but not used [-Wunused-but-set-variable]

It never used since introduction in commit c91c1c844ebd ("iio: imu: st_lsm6dsx:
add i2c embedded controller support")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c
index 8e47dcc..66fbcd9 100644
--- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c
+++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_shub.c
@@ -105,12 +105,10 @@ static void st_lsm6dsx_shub_wait_complete(struct st_lsm6dsx_hw *hw)
 static int st_lsm6dsx_shub_read_reg(struct st_lsm6dsx_hw *hw, u8 addr,
 				    u8 *data, int len)
 {
-	const struct st_lsm6dsx_shub_settings *hub_settings;
 	int err;
 
 	mutex_lock(&hw->page_lock);
 
-	hub_settings = &hw->settings->shub_settings;
 	err = st_lsm6dsx_set_page(hw, true);
 	if (err < 0)
 		goto out;
