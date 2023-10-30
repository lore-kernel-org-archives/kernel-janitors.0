Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0127EE
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 02:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id E712693;
	Sun, 29 Oct 2023 19:08:05 -0700 (PDT)
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id BC42D6027E05D;
	Mon, 30 Oct 2023 10:08:02 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: jic23@kernel.org,
	lars@metafoo.de
Cc: Su Hui <suhui@nfschina.com>,
	jean-baptiste.maneyrol@tdk.com,
	chenhuiz@axis.com,
	andy.shevchenko@gmail.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] iio: imu: inv_mpu6050: return callee's error code rather than -EINVAL
Date: Mon, 30 Oct 2023 10:07:53 +0800
Message-Id: <20231030020752.67630-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

regmap_bulk_write()/regmap_bulk_read() return zero or negative error
code, return the callee's error code is better than '-EINVAL'.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/iio/imu/inv_mpu6050/inv_mpu_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
index a9a5fb266ef1..5ded0781797c 100644
--- a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
+++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
@@ -572,7 +572,7 @@ static int inv_mpu6050_sensor_set(struct inv_mpu6050_state  *st, int reg,
 	ind = (axis - IIO_MOD_X) * 2;
 	result = regmap_bulk_write(st->map, reg + ind, &d, sizeof(d));
 	if (result)
-		return -EINVAL;
+		return result;
 
 	return 0;
 }
@@ -586,7 +586,7 @@ static int inv_mpu6050_sensor_show(struct inv_mpu6050_state  *st, int reg,
 	ind = (axis - IIO_MOD_X) * 2;
 	result = regmap_bulk_read(st->map, reg + ind, &d, sizeof(d));
 	if (result)
-		return -EINVAL;
+		return result;
 	*val = (short)be16_to_cpup(&d);
 
 	return IIO_VAL_INT;
-- 
2.30.2

