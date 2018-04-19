From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Date: Thu, 19 Apr 2018 14:06:17 +0000
Subject: [PATCH 47/61] staging: greybus: simplify getting .drvdata
Message-Id: <20180419140641.27926-48-wsa+renesas@sang-engineering.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org

We should get drvdata from struct device directly. Going via
platform_device is an unneeded step back and forth.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. buildbot is happy. Please apply individually.

 drivers/staging/greybus/arche-platform.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index 83254a72a7bb..8fe8b6e35432 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -315,8 +315,7 @@ static ssize_t state_store(struct device *dev,
 			   struct device_attribute *attr,
 			   const char *buf, size_t count)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct arche_platform_drvdata *arche_pdata = platform_get_drvdata(pdev);
+	struct arche_platform_drvdata *arche_pdata = dev_get_drvdata(dev);
 	int ret = 0;
 
 	mutex_lock(&arche_pdata->platform_state_mutex);
-- 
2.11.0

