From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 22 Sep 2020 08:14:16 +0000
Subject: [PATCH] mfd: max8998: fix potential double free in probe
Message-Id: <20200922081416.GB1274646@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lrg@slimlogic.co.uk>, Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The problem is that mfd_add_devices() calls mfd_remove_devices() on
failure and then the probe function will also call mfd_remove_devices().
I don't know exactly what problems this will cause but I'm pretty sure
that it will trigger the BUG_ON() at the start of ida_free().

One thing that this patch changes is that it adds a check for if
max8998_irq_init() fails.

Fixes: 156f252857df ("drivers: regulator: add Maxim 8998 driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Checking max8998_irq_init() is slightly risky because sometimes these
functions have been failing and we didn't know.

 drivers/mfd/max8998.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/max8998.c b/drivers/mfd/max8998.c
index 785f8e9841b7..9713c3ea4a63 100644
--- a/drivers/mfd/max8998.c
+++ b/drivers/mfd/max8998.c
@@ -202,7 +202,9 @@ static int max8998_i2c_probe(struct i2c_client *i2c,
 	}
 	i2c_set_clientdata(max8998->rtc, max8998);
 
-	max8998_irq_init(max8998);
+	ret = max8998_irq_init(max8998);
+	if (ret)
+		goto unregister_dummy;
 
 	pm_runtime_set_active(max8998->dev);
 
@@ -222,15 +224,15 @@ static int max8998_i2c_probe(struct i2c_client *i2c,
 	}
 
 	if (ret < 0)
-		goto err;
+		goto release_irq;
 
 	device_init_wakeup(max8998->dev, max8998->wakeup);
 
-	return ret;
+	return 0;
 
-err:
-	mfd_remove_devices(max8998->dev);
+release_irq:
 	max8998_irq_exit(max8998);
+unregister_dummy:
 	i2c_unregister_device(max8998->rtc);
 	return ret;
 }
-- 
2.28.0
