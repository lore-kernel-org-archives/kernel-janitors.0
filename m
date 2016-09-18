From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 18 Sep 2016 12:53:53 +0000
Subject: [PATCH 3/6] firmware-qemu_fw_cfg: Rename jump labels in fw_cfg_register_file()
Message-Id: <4c5acd9d-542b-e0e1-ebe3-3e7752019944@users.sourceforge.net>
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
Date: Sun, 18 Sep 2016 11:23:46 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/firmware/qemu_fw_cfg.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
index a229df6..a834d01 100644
--- a/drivers/firmware/qemu_fw_cfg.c
+++ b/drivers/firmware/qemu_fw_cfg.c
@@ -464,12 +464,12 @@ static int fw_cfg_register_file(const struct fw_cfg_file *f)
 	err = kobject_init_and_add(&entry->kobj, &fw_cfg_sysfs_entry_ktype,
 				   fw_cfg_sel_ko, "%d", entry->f.select);
 	if (err)
-		goto err_register;
+		goto free_entry;
 
 	/* add raw binary content access */
 	err = sysfs_create_bin_file(&entry->kobj, &fw_cfg_sysfs_attr_raw);
 	if (err)
-		goto err_add_raw;
+		goto delete_object;
 
 	/* try adding "/sys/firmware/qemu_fw_cfg/by_name/" symlink */
 	fw_cfg_build_symlink(fw_cfg_fname_kset, &entry->kobj, entry->f.name);
@@ -477,10 +477,9 @@ static int fw_cfg_register_file(const struct fw_cfg_file *f)
 	/* success, add entry to global cache */
 	fw_cfg_sysfs_cache_enlist(entry);
 	return 0;
-
-err_add_raw:
+ delete_object:
 	kobject_del(&entry->kobj);
-err_register:
+ free_entry:
 	kfree(entry);
 	return err;
 }
-- 
2.10.0

