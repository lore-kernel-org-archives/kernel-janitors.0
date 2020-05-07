From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 07 May 2020 05:22:11 +0000
Subject: [PATCH -next] visorbus: fix error return code in visorchipset_init()
Message-Id: <20200507052211.103018-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Kershner <david.kershner@unisys.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, sparmaintainer@unisys.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return negative error code -ENODEV from the visor_check_channel()
error handling case instead of 0. Also change the error code to -ENOMEM
in kzalloc() error case.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/visorbus/visorchipset.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/visorbus/visorchipset.c b/drivers/visorbus/visorchipset.c
index cb1eb7e05f87..5668cad86e37 100644
--- a/drivers/visorbus/visorchipset.c
+++ b/drivers/visorbus/visorchipset.c
@@ -1561,7 +1561,7 @@ static void controlvm_periodic_work(struct work_struct *work)
 
 static int visorchipset_init(struct acpi_device *acpi_device)
 {
-	int err = -ENODEV;
+	int err = -ENOMEM;
 	struct visorchannel *controlvm_channel;
 
 	chipset_dev = kzalloc(sizeof(*chipset_dev), GFP_KERNEL);
@@ -1584,8 +1584,10 @@ static int visorchipset_init(struct acpi_device *acpi_device)
 				 "controlvm",
 				 sizeof(struct visor_controlvm_channel),
 				 VISOR_CONTROLVM_CHANNEL_VERSIONID,
-				 VISOR_CHANNEL_SIGNATURE))
+				 VISOR_CHANNEL_SIGNATURE)) {
+		err = -ENODEV;
 		goto error_delete_groups;
+	}
 	/* if booting in a crash kernel */
 	if (is_kdump_kernel())
 		INIT_DELAYED_WORK(&chipset_dev->periodic_controlvm_work,
