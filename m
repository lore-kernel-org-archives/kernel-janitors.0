From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Apr 2020 09:30:52 +0000
Subject: [PATCH] platform/x86: surface3_power: Fix a NULL vs IS_ERR() check in probe
Message-Id: <20200407093052.GL68494@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Darren Hart <dvhart@infradead.org>, =?utf-8?B?Qmxhxb4=?= Hrastnik <blaz@mxxn.io>
Cc: Andy Shevchenko <andy@infradead.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Stephen Just <stephenjust@gmail.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

The i2c_acpi_new_device() function never returns NULL, it returns error
pointers.

Fixes: b1f81b496b0d ("platform/x86: surface3_power: MSHW0011 rev-eng implementation")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/platform/x86/surface3_power.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/surface3_power.c b/drivers/platform/x86/surface3_power.c
index 946ac2dc08ae..cc4f9cba6856 100644
--- a/drivers/platform/x86/surface3_power.c
+++ b/drivers/platform/x86/surface3_power.c
@@ -522,8 +522,8 @@ static int mshw0011_probe(struct i2c_client *client)
 	strlcpy(board_info.type, "MSHW0011-bat0", I2C_NAME_SIZE);
 
 	bat0 = i2c_acpi_new_device(dev, 1, &board_info);
-	if (!bat0)
-		return -ENOMEM;
+	if (IS_ERR(bat0))
+		return PTR_ERR(bat0);
 
 	data->bat0 = bat0;
 	i2c_set_clientdata(bat0, data);
-- 
2.25.1
