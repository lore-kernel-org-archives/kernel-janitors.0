From: Dan Carpenter <error27@gmail.com>
Date: Fri, 19 Mar 2010 11:44:11 +0000
Subject: [patch] sbshc: acpi_device_class "smbus_host_controller" too long
Message-Id: <20100319114411.GM5331@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexey Starikovskiy <astarikovskiy@suse.de>
Cc: Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

acpi_device_class can only be 19 characters and a NULL terminator.

With the current name we get a buffer overflow in acpi_smbus_hc_add()
when we do: 
	strcpy(acpi_device_class(device), ACPI_SMB_HC_CLASS);

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/acpi/sbshc.c b/drivers/acpi/sbshc.c
index fd09229..1fbf073 100644
--- a/drivers/acpi/sbshc.c
+++ b/drivers/acpi/sbshc.c
@@ -17,7 +17,7 @@
 
 #define PREFIX "ACPI: "
 
-#define ACPI_SMB_HC_CLASS	"smbus_host_controller"
+#define ACPI_SMB_HC_CLASS	"smbus_host_ctl"
 #define ACPI_SMB_HC_DEVICE_NAME	"ACPI SMBus HC"
 
 struct acpi_smb_hc {
