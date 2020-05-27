From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 27 May 2020 02:24:17 +0000
Subject: [PATCH -next] hwmon: amd_energy: Missing platform_driver_unregister() on error in amd_energy_init()
Message-Id: <20200527022417.105620-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Naveen Krishna Chatradhi <nchatrad@amd.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

Add the missing platform_driver_unregister() before return
from amd_energy_init() in the error handling case.

Fixes: 8abee9566b7e ("hwmon: Add amd_energy driver to report energy counters")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/hwmon/amd_energy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c
index bc8b643a37d5..e95b7426106e 100644
--- a/drivers/hwmon/amd_energy.c
+++ b/drivers/hwmon/amd_energy.c
@@ -379,8 +379,10 @@ static int __init amd_energy_init(void)
 		return ret;
 
 	amd_energy_platdev = platform_device_alloc(DRVNAME, 0);
-	if (!amd_energy_platdev)
+	if (!amd_energy_platdev) {
+		platform_driver_unregister(&amd_energy_driver);
 		return -ENOMEM;
+	}
 
 	ret = platform_device_add(amd_energy_platdev);
 	if (ret) {
