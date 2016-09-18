From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 12:56:50 +0000
Subject: [PATCH 5/6] firmware-qemu_fw_cfg: Rename jump labels in fw_cfg_sysfs_probe()
Message-Id: <dd7faed2-8bc4-6bc2-a442-4d7f8f1b5782@users.sourceforge.net>
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
Date: Sun, 18 Sep 2016 14:04:48 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/firmware/qemu_fw_cfg.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
index a4b108a..a09e59c 100644
--- a/drivers/firmware/qemu_fw_cfg.c
+++ b/drivers/firmware/qemu_fw_cfg.c
@@ -538,42 +538,41 @@ static int fw_cfg_sysfs_probe(struct platform_device *pdev)
 	err = -ENOMEM;
 	fw_cfg_sel_ko = kobject_create_and_add("by_key", fw_cfg_top_ko);
 	if (!fw_cfg_sel_ko)
-		goto err_sel;
+		goto exit;
 	fw_cfg_fname_kset = kset_create_and_add("by_name", NULL, fw_cfg_top_ko);
 	if (!fw_cfg_fname_kset)
-		goto err_name;
+		goto cleanup_object;
 
 	/* initialize fw_cfg device i/o from platform data */
 	err = fw_cfg_do_platform_probe(pdev);
 	if (err)
-		goto err_probe;
+		goto unregister;
 
 	/* get revision number, add matching top-level attribute */
 	fw_cfg_read_blob(FW_CFG_ID, &fw_cfg_rev, 0, sizeof(fw_cfg_rev));
 	fw_cfg_rev = le32_to_cpu(fw_cfg_rev);
 	err = sysfs_create_file(fw_cfg_top_ko, &fw_cfg_rev_attr.attr);
 	if (err)
-		goto err_rev;
+		goto cleanup_io;
 
 	/* process fw_cfg file directory entry, registering each file */
 	err = fw_cfg_register_dir_entries();
 	if (err)
-		goto err_dir;
+		goto cleanup_cache;
 
 	/* success */
 	pr_debug("fw_cfg: loaded.\n");
 	return 0;
-
-err_dir:
+ cleanup_cache:
 	fw_cfg_sysfs_cache_cleanup();
 	sysfs_remove_file(fw_cfg_top_ko, &fw_cfg_rev_attr.attr);
-err_rev:
+ cleanup_io:
 	fw_cfg_io_cleanup();
-err_probe:
+ unregister:
 	fw_cfg_kset_unregister_recursive(fw_cfg_fname_kset);
-err_name:
+ cleanup_object:
 	fw_cfg_kobj_cleanup(fw_cfg_sel_ko);
-err_sel:
+ exit:
 	return err;
 }
 
-- 
2.10.0

