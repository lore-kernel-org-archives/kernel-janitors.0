From: Mao Wenan <maowenan@huawei.com>
Date: Wed, 04 Dec 2019 01:05:06 +0000
Subject: [PATCH -next] power: supply: ab8500: Drop pointless static qualifier in ab8500_btemp_batctrl_volt_to
Message-Id: <20191204010506.159128-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sre@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mao Wenan <maowenan@huawei.com>, Hulk Robot <hulkci@huawei.com>

There is no need to have the 'T *v' variable static
since new value always be assigned before use it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 drivers/power/supply/ab8500_btemp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/ab8500_btemp.c b/drivers/power/supply/ab8500_btemp.c
index 909f0242bacb..d3d4f7327d1b 100644
--- a/drivers/power/supply/ab8500_btemp.c
+++ b/drivers/power/supply/ab8500_btemp.c
@@ -180,7 +180,7 @@ static int ab8500_btemp_batctrl_volt_to_res(struct ab8500_btemp *di,
 static int ab8500_btemp_read_batctrl_voltage(struct ab8500_btemp *di)
 {
 	int vbtemp, ret;
-	static int prev;
+	int prev;
 
 	ret = iio_read_channel_processed(di->bat_ctrl, &vbtemp);
 	if (ret < 0) {
-- 
2.20.1
