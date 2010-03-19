From: Dan Carpenter <error27@gmail.com>
Date: Fri, 19 Mar 2010 11:48:06 +0000
Subject: [patch] acpi_pad: "processor_aggregator" name too long
Message-Id: <20100319114806.GN5331@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shaohua Li <shaohua.li@intel.com>
Cc: Len Brown <lenb@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Chen Gong <gong.chen@linux.intel.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

cpi_device_class can only be 19 characters and a NULL terminator.

With the current name we get a buffer overflow in acpi_pad_add()
        strcpy(acpi_device_class(device), ACPI_PROCESSOR_AGGREGATOR_CLASS);

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Feel free to pick your own name if you don't like mine.  :)


diff --git a/drivers/acpi/acpi_pad.c b/drivers/acpi/acpi_pad.c
index 7e52295..2db89d9 100644
--- a/drivers/acpi/acpi_pad.c
+++ b/drivers/acpi/acpi_pad.c
@@ -30,7 +30,7 @@
 #include <acpi/acpi_bus.h>
 #include <acpi/acpi_drivers.h>
 
-#define ACPI_PROCESSOR_AGGREGATOR_CLASS	"processor_aggregator"
+#define ACPI_PROCESSOR_AGGREGATOR_CLASS	"proc_aggregator"
 #define ACPI_PROCESSOR_AGGREGATOR_DEVICE_NAME "Processor Aggregator"
 #define ACPI_PROCESSOR_AGGREGATOR_NOTIFY 0x80
 static DEFINE_MUTEX(isolated_cpus_lock);
