From: Szymon Janc <szymon@janc.net.pl>
Date: Mon, 09 Jan 2012 22:23:25 +0000
Subject: [PATCH 06/16] Staging: quickstart: Cleanup quickstart_acpi_remove
Message-Id: <1326147815-11451-7-git-send-email-szymon@janc.net.pl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Szymon Janc <szymon@janc.net.pl>
---
 drivers/staging/quickstart/quickstart.c |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/quickstart/quickstart.c b/drivers/staging/quickstart/quickstart.c
index 3bae5e7..de98e18 100644
--- a/drivers/staging/quickstart/quickstart.c
+++ b/drivers/staging/quickstart/quickstart.c
@@ -309,13 +309,15 @@ fail_config:
 
 static int quickstart_acpi_remove(struct acpi_device *device, int type)
 {
-	acpi_status status = 0;
-	struct quickstart_acpi *quickstart = NULL;
+	acpi_status status;
+	struct quickstart_acpi *quickstart;
 
-	if (!device || !acpi_driver_data(device))
+	if (!device)
 		return -EINVAL;
 
 	quickstart = acpi_driver_data(device);
+	if (!quickstart)
+		return -EINVAL;
 
 	status = acpi_remove_notify_handler(device->handle, ACPI_ALL_NOTIFY,
 						quickstart_acpi_notify);
-- 
1.7.8.2


