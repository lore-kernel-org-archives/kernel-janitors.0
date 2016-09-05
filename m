From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 05 Sep 2016 16:45:05 +0000
Subject: [PATCH 01/21] ACPI-video: Use kmalloc_array() in acpi_video_get_levels()
Message-Id: <3af3b2e0-7cca-033c-da7e-caa1c62e20bb@users.sourceforge.net>
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
Date: Mon, 5 Sep 2016 11:33:30 +0200

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "kmalloc_array".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/acpi/acpi_video.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
index c5557d0..3d39b53 100644
--- a/drivers/acpi/acpi_video.c
+++ b/drivers/acpi/acpi_video.c
@@ -784,8 +784,9 @@ int acpi_video_get_levels(struct acpi_device *device,
 		goto out;
 	}
 
-	br->levels = kmalloc((obj->package.count + 2) * sizeof *(br->levels),
-				GFP_KERNEL);
+	br->levels = kmalloc_array(obj->package.count + 2,
+				   sizeof(*br->levels),
+				   GFP_KERNEL);
 	if (!br->levels) {
 		result = -ENOMEM;
 		goto out_free;
-- 
2.10.0

