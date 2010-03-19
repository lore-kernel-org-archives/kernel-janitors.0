From: Dan Carpenter <error27@gmail.com>
Date: Fri, 19 Mar 2010 11:49:20 +0000
Subject: [patch] power_meter: acpi_device_class "power_meter_resource" too
Message-Id: <20100319114920.GP5331@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Len Brown <lenb@kernel.org>
Cc: "Darrick J. Wong" <djwong@us.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, =?iso-8859-1?Q?M=E1rton_N=E9meth?= <nm127@freemail.hu>, Lin Ming <ming.m.lin@intel.com>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

acpi_device_class can only be 19 characters and a NULL terminator.

The current code has a buffer overflow in acpi_power_meter_add():
       strcpy(acpi_device_class(device), ACPI_POWER_METER_CLASS);

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Feel free to change the name to anything you like.

diff --git a/drivers/acpi/power_meter.c b/drivers/acpi/power_meter.c
index 834c5af..31baa1e 100644
--- a/drivers/acpi/power_meter.c
+++ b/drivers/acpi/power_meter.c
@@ -34,7 +34,7 @@
 #define ACPI_POWER_METER_NAME		"power_meter"
 ACPI_MODULE_NAME(ACPI_POWER_METER_NAME);
 #define ACPI_POWER_METER_DEVICE_NAME	"Power Meter"
-#define ACPI_POWER_METER_CLASS		"power_meter_resource"
+#define ACPI_POWER_METER_CLASS		"pwr_meter_resource"
 
 #define NUM_SENSORS			17
 
