From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 12:58:14 +0000
Subject: [PATCH 6/6] firmware-qemu_fw_cfg: Move a variable assignment in fw_cfg_sysfs_probe()
Message-Id: <4546d20a-6e9c-5192-35c1-116bff2b3fc8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <a736b350-a691-c73b-b8e9-67c0bffb716a@users.sourceforge.net>
In-Reply-To: <a736b350-a691-c73b-b8e9-67c0bffb716a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: qemu-devel@nongnu.org, Gabriel Somlo <somlo@cmu.edu>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 14:25:55 +0200

One local variable was set to an error code before a concrete
error situation was detected. Thus move the corresponding assignment into
two if branches to indicate a software failure there.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/firmware/qemu_fw_cfg.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
index a09e59c..23293a1 100644
--- a/drivers/firmware/qemu_fw_cfg.c
+++ b/drivers/firmware/qemu_fw_cfg.c
@@ -535,13 +535,16 @@ static int fw_cfg_sysfs_probe(struct platform_device *pdev)
 		return -EBUSY;
 
 	/* create by_key and by_name subdirs of /sys/firmware/qemu_fw_cfg/ */
-	err = -ENOMEM;
 	fw_cfg_sel_ko = kobject_create_and_add("by_key", fw_cfg_top_ko);
-	if (!fw_cfg_sel_ko)
+	if (!fw_cfg_sel_ko) {
+		err = -ENOMEM;
 		goto exit;
+	}
 	fw_cfg_fname_kset = kset_create_and_add("by_name", NULL, fw_cfg_top_ko);
-	if (!fw_cfg_fname_kset)
+	if (!fw_cfg_fname_kset) {
+		err = -ENOMEM;
 		goto cleanup_object;
+	}
 
 	/* initialize fw_cfg device i/o from platform data */
 	err = fw_cfg_do_platform_probe(pdev);
-- 
2.10.0

