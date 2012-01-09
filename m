From: Szymon Janc <szymon@janc.net.pl>
Date: Mon, 09 Jan 2012 22:23:27 +0000
Subject: [PATCH 08/16] Staging: quickstart: Cleanup quickstart_acpi_config
Message-Id: <1326147815-11451-9-git-send-email-szymon@janc.net.pl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: Szymon Janc <szymon@janc.net.pl>
---
 drivers/staging/quickstart/quickstart.c |   21 ++++++++++++---------
 1 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/quickstart/quickstart.c b/drivers/staging/quickstart/quickstart.c
index 97e62e9..b183d21 100644
--- a/drivers/staging/quickstart/quickstart.c
+++ b/drivers/staging/quickstart/quickstart.c
@@ -240,21 +240,24 @@ static int quickstart_acpi_ghid(struct quickstart_acpi *quickstart)
 	return ret;
 }
 
-static int quickstart_acpi_config(struct quickstart_acpi *quickstart, char *bid)
+static int quickstart_acpi_config(struct quickstart_acpi *quickstart)
 {
-	int len = strlen(bid);
+	char *bid = acpi_device_bid(quickstart->device);
+	char *name;
 	int ret;
 
+	name = kmalloc(strlen(bid) + 1, GFP_KERNEL);
+	if (!name)
+		return -ENOMEM;
+
 	/* Add button to list */
 	ret = quickstart_btnlst_add(&quickstart->btn);
-	if (ret)
+	if (ret < 0) {
+		kfree(name);
 		return ret;
-
-	quickstart->btn->name = kzalloc(len + 1, GFP_KERNEL);
-	if (!quickstart->btn->name) {
-		quickstart_btnlst_free();
-		return -ENOMEM;
 	}
+
+	quickstart->btn->name = name;
 	strcpy(quickstart->btn->name, bid);
 
 	return 0;
@@ -280,7 +283,7 @@ static int quickstart_acpi_add(struct acpi_device *device)
 	device->driver_data = quickstart;
 
 	/* Add button to list and initialize some stuff */
-	ret = quickstart_acpi_config(quickstart, acpi_device_bid(device));
+	ret = quickstart_acpi_config(quickstart);
 	if (ret < 0)
 		goto fail_config;
 
-- 
1.7.8.2


