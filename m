From: "Manish Katiyar" <mkatiyar@gmail.com>
Date: Sun, 03 Aug 2008 07:36:28 +0000
Subject: [PATCH] Remove warning 'unused variable battery' in drivers/acpi/sbs.c
Message-Id: <ea11fea30808030024v18912201x46d12fe389e508f8@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, astarikovskiy@suse.de, vladimir.p.lebedev@intel.com, LKML <linux-kernel@vger.kernel.org>, trivial@vger.kernel.org
Cc: mkatiyar@gmail.com

Below patch removes the following warning:
drivers/acpi/sbs.c: In function 'acpi_battery_remove':
drivers/acpi/sbs.c:819: warning: unused variable 'battery'



Signed-off-by:- "Manish Katiyar" <mkatiyar@gmail.com>

---
 drivers/acpi/sbs.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/acpi/sbs.c b/drivers/acpi/sbs.c
index 10a3651..8493603 100644
--- a/drivers/acpi/sbs.c
+++ b/drivers/acpi/sbs.c
@@ -816,7 +816,9 @@ static int acpi_battery_add(struct acpi_sbs *sbs, int id)

 static void acpi_battery_remove(struct acpi_sbs *sbs, int id)
 {
+#ifdef CONFIG_ACPI_SYSFS_POWER || CONFIG_ACPI_PROCFS_POWER
 	struct acpi_battery *battery = &sbs->battery[id];
+#endif
 #ifdef CONFIG_ACPI_SYSFS_POWER
 	if (battery->bat.dev) {
 		if (battery->have_sysfs_alarm)
-- 
1.5.4.3



Thanks -
Manish
