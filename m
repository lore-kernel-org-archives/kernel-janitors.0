From: Colin King <colin.king@canonical.com>
Date: Thu, 29 Jun 2017 09:49:25 +0000
Subject: [PATCH] ACPI / osi: make local function acpi_osi_dmi_linux static
Message-Id: <20170629094925.10884-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function acpi_osi_dmi_linux is local and does not need to be in
global scope, so make it static.

Cleans up sparse warning:
"symbol 'acpi_osi_dmi_linux' was not declared. Should it be static?"

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/acpi/osi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/osi.c b/drivers/acpi/osi.c
index 849f9d2245ca..723bee58bbcf 100644
--- a/drivers/acpi/osi.c
+++ b/drivers/acpi/osi.c
@@ -265,7 +265,8 @@ static void __init acpi_osi_dmi_darwin(bool enable,
 	__acpi_osi_setup_darwin(enable);
 }
 
-void __init acpi_osi_dmi_linux(bool enable, const struct dmi_system_id *d)
+static void __init acpi_osi_dmi_linux(bool enable,
+				      const struct dmi_system_id *d)
 {
 	pr_notice("DMI detected to setup _OSI(\"Linux\"): %s\n", d->ident);
 	osi_config.linux_dmi = 1;
-- 
2.11.0

