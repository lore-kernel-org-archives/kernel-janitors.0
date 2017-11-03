From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 03 Nov 2017 19:50:06 +0000
Subject: [PATCH] staging: unisys: visorchipset: Use common error handling code in setup_crash_devices_work_qu
Message-Id: <d2542edd-2bd6-db05-2d60-2b601e73111c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, sparmaintainer@unisys.com, Bryan Thompson <bryan.thompson@unisys.com>, David Binder <david.binder@unisys.com>, David Kershner <david.kershner@unisys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sameer Wadgaonkar <sameer.wadgaonkar@unisys.com>, Tim Sell <timothy.sell@unisys.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 3 Nov 2017 20:37:03 +0100

* Add a jump target so that a specific error message is stored only once
  at the end of this function implementation.

* Replace four calls of the function "dev_err" by goto statements.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/unisys/visorbus/visorchipset.c | 36 ++++++++++++--------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/unisys/visorbus/visorchipset.c b/drivers/staging/unisys/visorbus/visorchipset.c
index fed554a43151..1d54821dd7b6 100644
--- a/drivers/staging/unisys/visorbus/visorchipset.c
+++ b/drivers/staging/unisys/visorbus/visorchipset.c
@@ -1231,11 +1231,9 @@ static void setup_crash_devices_work_queue(struct work_struct *work)
 	if (visorchannel_read(chipset_dev->controlvm_channel,
 			      offsetof(struct visor_controlvm_channel,
 				       saved_crash_message_count),
-			      &local_crash_msg_count, sizeof(u16)) < 0) {
-		dev_err(&chipset_dev->acpi_device->dev,
-			"failed to read channel\n");
-		return;
-	}
+			      &local_crash_msg_count, sizeof(u16)) < 0)
+		goto report_read_failure;
+
 	if (local_crash_msg_count != CONTROLVM_CRASHMSG_MAX) {
 		dev_err(&chipset_dev->acpi_device->dev, "invalid count\n");
 		return;
@@ -1244,30 +1242,24 @@ static void setup_crash_devices_work_queue(struct work_struct *work)
 	if (visorchannel_read(chipset_dev->controlvm_channel,
 			      offsetof(struct visor_controlvm_channel,
 				       saved_crash_message_offset),
-			      &local_crash_msg_offset, sizeof(u32)) < 0) {
-		dev_err(&chipset_dev->acpi_device->dev,
-			"failed to read channel\n");
-		return;
-	}
+			      &local_crash_msg_offset, sizeof(u32)) < 0)
+		goto report_read_failure;
+
 	/* read create device message for storage bus offset */
 	if (visorchannel_read(chipset_dev->controlvm_channel,
 			      local_crash_msg_offset,
 			      &local_crash_bus_msg,
-			      sizeof(struct controlvm_message)) < 0) {
-		dev_err(&chipset_dev->acpi_device->dev,
-			"failed to read channel\n");
-		return;
-	}
+			      sizeof(struct controlvm_message)) < 0)
+		goto report_read_failure;
+
 	/* read create device message for storage device */
 	if (visorchannel_read(chipset_dev->controlvm_channel,
 			      local_crash_msg_offset +
 			      sizeof(struct controlvm_message),
 			      &local_crash_dev_msg,
-			      sizeof(struct controlvm_message)) < 0) {
-		dev_err(&chipset_dev->acpi_device->dev,
-			"failed to read channel\n");
-		return;
-	}
+			      sizeof(struct controlvm_message)) < 0)
+		goto report_read_failure;
+
 	/* reuse IOVM create bus message */
 	if (!local_crash_bus_msg.cmd.create_bus.channel_addr) {
 		dev_err(&chipset_dev->acpi_device->dev,
@@ -1282,6 +1274,10 @@ static void setup_crash_devices_work_queue(struct work_struct *work)
 		return;
 	}
 	visorbus_device_create(&local_crash_dev_msg);
+	return;
+
+report_read_failure:
+	dev_err(&chipset_dev->acpi_device->dev, "failed to read channel\n");
 }
 
 void visorbus_response(struct visor_device *bus_info, int response,
-- 
2.15.0

