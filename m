From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 05 Sep 2016 16:56:18 +0000
Subject: [PATCH 09/21] ACPI-video: Rename jump labels in acpi_video_register()
Message-Id: <ecbd8b3c-cb43-8f10-abea-519f62683448@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <897ebf36-2fe5-e109-adf6-b81b6e863d9a@users.sourceforge.net>
In-Reply-To: <897ebf36-2fe5-e109-adf6-b81b6e863d9a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-acpi@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Len Brown <lenb@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Zhang Rui <rui.zhang@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 5 Sep 2016 15:28:12 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/acpi/acpi_video.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
index c9fbc6e..74e5a40 100644
--- a/drivers/acpi/acpi_video.c
+++ b/drivers/acpi/acpi_video.c
@@ -2080,22 +2080,21 @@ int acpi_video_register(void)
 		 * if the function of acpi_video_register is already called,
 		 * don't register the acpi_vide_bus again and return no error.
 		 */
-		goto leave;
+		goto unlock;
 	}
 
 	dmi_check_system(video_dmi_table);
 
 	ret = acpi_bus_register_driver(&acpi_video_bus);
 	if (ret)
-		goto leave;
+		goto unlock;
 
 	/*
 	 * When the acpi_video_bus is loaded successfully, increase
 	 * the counter reference.
 	 */
 	register_count = 1;
-
-leave:
+ unlock:
 	mutex_unlock(&register_count_mutex);
 	return ret;
 }
-- 
2.10.0

