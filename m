From: Colin King <colin.king@canonical.com>
Date: Sat, 29 Feb 2020 00:12:43 +0000
Subject: [PATCH] ACPI: video: remove redundant assignments to variable result
Message-Id: <20200229001243.113176-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhang Rui <rui.zhang@intel.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable result is being initialized with a value that is never
read and it is being updated later with a new value. The initialization
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/acpi/acpi_video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
index 15c5b272e698..bc96457c9e25 100644
--- a/drivers/acpi/acpi_video.c
+++ b/drivers/acpi/acpi_video.c
@@ -943,7 +943,7 @@ acpi_video_init_brightness(struct acpi_video_device *device)
 	int i, max_level = 0;
 	unsigned long long level, level_old;
 	struct acpi_video_device_brightness *br = NULL;
-	int result = -EINVAL;
+	int result;
 
 	result = acpi_video_get_levels(device->dev, &br, &max_level);
 	if (result)
-- 
2.25.0
