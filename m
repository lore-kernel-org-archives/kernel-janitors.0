From: "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>
Date: Wed, 27 May 2020 02:28:06 +0000
Subject: RE: [PATCH -next] hwmon: amd_energy: Missing platform_driver_unregister() on error in amd_energy_ini
Message-Id: <BY5PR12MB42125FF6FEE5F146C428E295E8B10@BY5PR12MB4212.namprd12.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200527022417.105620-1-weiyongjun1@huawei.com>
In-Reply-To: <20200527022417.105620-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>

[AMD Official Use Only - Internal Distribution Only]

Hi Yongjun,

Thanks,
Acked-by: Naveen krishna Chatradhi <nchatrad@amd.com>

-----Original Message-----
From: linux-hwmon-owner@vger.kernel.org <linux-hwmon-owner@vger.kernel.org> On Behalf Of Wei Yongjun
Sent: Wednesday, May 27, 2020 7:54 AM
To: Chatradhi, Naveen Krishna <NaveenKrishna.Chatradhi@amd.com>; Jean Delvare <jdelvare@suse.com>; Guenter Roeck <linux@roeck-us.net>
Cc: Wei Yongjun <weiyongjun1@huawei.com>; linux-hwmon@vger.kernel.org; kernel-janitors@vger.kernel.org; Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] hwmon: amd_energy: Missing platform_driver_unregister() on error in amd_energy_init()

[CAUTION: External Email]

Add the missing platform_driver_unregister() before return from amd_energy_init() in the error handling case.

Fixes: 8abee9566b7e ("hwmon: Add amd_energy driver to report energy counters")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/hwmon/amd_energy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/amd_energy.c b/drivers/hwmon/amd_energy.c index bc8b643a37d5..e95b7426106e 100644
--- a/drivers/hwmon/amd_energy.c
+++ b/drivers/hwmon/amd_energy.c
@@ -379,8 +379,10 @@ static int __init amd_energy_init(void)
                return ret;

        amd_energy_platdev = platform_device_alloc(DRVNAME, 0);
-       if (!amd_energy_platdev)
+       if (!amd_energy_platdev) {
+               platform_driver_unregister(&amd_energy_driver);
                return -ENOMEM;
+       }

        ret = platform_device_add(amd_energy_platdev);
        if (ret) {
