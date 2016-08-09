From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 09 Aug 2016 15:33:43 +0000
Subject: [PATCH] misc: mic: constify mic_smpt_ops structure
Message-Id: <1470756823-29282-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudeep Dutt <sudeep.dutt@intel.com>
Cc: kernel-janitors@vger.kernel.org, Ashutosh Dixit <ashutosh.dixit@intel.com>, linux-kernel@vger.kernel.org

The mic_smpt_ops structure is never modified, so declare is as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/misc/mic/host/mic_device.h |    2 +-
 drivers/misc/mic/host/mic_x100.c   |    2 +-
 drivers/misc/mic/host/mic_x100.h   |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/mic/host/mic_device.h b/drivers/misc/mic/host/mic_device.h
index 52b12b2..2162a8f 100644
--- a/drivers/misc/mic/host/mic_device.h
+++ b/drivers/misc/mic/host/mic_device.h
@@ -82,7 +82,7 @@ struct mic_device {
 	struct pci_dev *pdev;
 	struct mutex mic_mutex;
 	struct mic_hw_intr_ops *intr_ops;
-	struct mic_smpt_ops *smpt_ops;
+	const struct mic_smpt_ops *smpt_ops;
 	struct mic_smpt_info *smpt;
 	struct mic_intr_info *intr_info;
 	struct mic_irq_info irq_info;
diff --git a/drivers/misc/mic/host/mic_x100.c b/drivers/misc/mic/host/mic_x100.c
index 82a973c..ef40b00 100644
--- a/drivers/misc/mic/host/mic_x100.c
+++ b/drivers/misc/mic/host/mic_x100.c
@@ -546,7 +546,7 @@ static void mic_x100_smpt_hw_init(struct mic_device *mdev)
 	info->base = 0x8000000000ULL;
 }
 
-struct mic_smpt_ops mic_x100_smpt_ops = {
+const struct mic_smpt_ops mic_x100_smpt_ops = {
 	.init = mic_x100_smpt_hw_init,
 	.set = mic_x100_smpt_set,
 };
diff --git a/drivers/misc/mic/host/mic_x100.h b/drivers/misc/mic/host/mic_x100.h
index 8b7daa1..457b3a1 100644
--- a/drivers/misc/mic/host/mic_x100.h
+++ b/drivers/misc/mic/host/mic_x100.h
@@ -92,7 +92,7 @@ static const u16 mic_x100_intr_init[] = {
 #define MIC_X100_BSP_INTERRUPT_VECTOR 229
 
 extern struct mic_hw_ops mic_x100_ops;
-extern struct mic_smpt_ops mic_x100_smpt_ops;
+extern const struct mic_smpt_ops mic_x100_smpt_ops;
 extern struct mic_hw_intr_ops mic_x100_intr_ops;
 
 #endif

