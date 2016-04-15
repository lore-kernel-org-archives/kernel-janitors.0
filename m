From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 15 Apr 2016 14:47:20 +0000
Subject: [patch] hp_accel: Silence an uninitialized variable warning
Message-Id: <20160415144720.GF8953@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Piel <eric.piel@tremplin-utc.net>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

If acpi_evaluate_integer() fails then "lret" isn't initialized.  I've
tweaked the error handling to avoid this issue.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/hp_accel.c
index 10ce6cb..746918e 100644
--- a/drivers/platform/x86/hp_accel.c
+++ b/drivers/platform/x86/hp_accel.c
@@ -127,8 +127,10 @@ static int lis3lv02d_acpi_read(struct lis3lv02d *lis3, int reg, u8 *ret)
 	arg0.integer.value = reg;
 
 	status = acpi_evaluate_integer(dev->handle, "ALRD", &args, &lret);
+	if (ACPI_FAILURE(status))
+		return -EINVAL;
 	*ret = lret;
-	return (status != AE_OK) ? -EINVAL : 0;
+	return 0;
 }
 
 /**
