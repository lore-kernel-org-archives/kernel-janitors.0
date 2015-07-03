From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 03 Jul 2015 08:56:53 +0000
Subject: [patch] ACPI / LPSS: set an error code
Message-Id: <20150703085653.GC11901@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, kernel-janitors@vger.kernel.org

We should return -ENOMEM if ioremap() fails.

Fixes: 4483d59e29fe ('ACPI / LPSS: check the result of ioremap()')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/acpi/acpi_lpss.c b/drivers/acpi/acpi_lpss.c
index 569ee09..10bf5c7 100644
--- a/drivers/acpi/acpi_lpss.c
+++ b/drivers/acpi/acpi_lpss.c
@@ -352,8 +352,10 @@ static int acpi_lpss_create_device(struct acpi_device *adev,
 				pdata->mmio_size = resource_size(rentry->res);
 			pdata->mmio_base = ioremap(rentry->res->start,
 						   pdata->mmio_size);
-			if (!pdata->mmio_base)
+			if (!pdata->mmio_base) {
+				ret = -ENOMEM;
 				goto err_out;
+			}
 			break;
 		}
 
