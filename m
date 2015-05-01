From: Adir Kuhn <adirkuhn@gmail.com>
Date: Fri, 01 May 2015 20:55:56 +0000
Subject: [PATCH] acpi: ac: Fixed code style on pointer declaration
Message-Id: <1430513756-23114-1-git-send-email-adirkuhn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixed code stule on pointer declaration

Signed-off-by: Adir Kuhn <adirkuhn@gmail.com>
---
 drivers/acpi/ac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/ac.c b/drivers/acpi/ac.c
index bbcc2b5..406e373 100644
--- a/drivers/acpi/ac.c
+++ b/drivers/acpi/ac.c
@@ -97,7 +97,7 @@ static struct acpi_driver acpi_ac_driver = {
 struct acpi_ac {
 	struct power_supply *charger;
 	struct power_supply_desc charger_desc;
-	struct acpi_device * device;
+	struct acpi_device *device;
 	unsigned long long state;
 	struct notifier_block battery_nb;
 };
-- 
2.1.4

