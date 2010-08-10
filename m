From: Dan Carpenter <error27@gmail.com>
Date: Tue, 10 Aug 2010 05:42:25 +0000
Subject: [patch] Staging: quickstart: acpi_status is unsigned
Message-Id: <20100810054225.GQ9031@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

acpi_bus_register_driver() returns an int, not acpi_status.  It returns
zero on success and negative error codes on failure, but acpi_status is
unsigned.  We can just use "ret" here.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/quickstart/quickstart.c b/drivers/staging/quickstart/quickstart.c
index 6612247..33c09fa 100644
--- a/drivers/staging/quickstart/quickstart.c
+++ b/drivers/staging/quickstart/quickstart.c
@@ -398,16 +398,15 @@ static int __init quickstart_init_input(void)
 static int __init quickstart_init(void)
 {
 	int ret;
-	acpi_status status = 0;
 
 	/* ACPI Check */
 	if (acpi_disabled)
 		return -ENODEV;
 
 	/* ACPI driver register */
-	status = acpi_bus_register_driver(&quickstart_acpi_driver);
-	if (status < 0)
-		return -ENODEV;
+	ret = acpi_bus_register_driver(&quickstart_acpi_driver);
+	if (ret)
+		return ret;
 
 	/* If existing bus with no devices */
 	if (!quickstart_data.btn_lst) {
