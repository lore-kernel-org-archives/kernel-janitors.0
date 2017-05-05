From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 05 May 2017 19:08:44 +0000
Subject: [PATCH] firmware: Google VPD: Fix memory allocation error handling
Message-Id: <20170505190844.2945-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, thierry.escande@collabora.com, wnhuang@google.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

This patch fixes several issues:
   - if the 1st 'kzalloc' fails, we dereference a NULL pointer
   - if the 2nd 'kzalloc' fails, there is a memory leak
   - if 'sysfs_create_bin_file' fails there is also a memory leak

Fix it by adding a test after the first memory allocation and some error
handling paths to correctly free memory if needed.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/firmware/google/vpd.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/google/vpd.c b/drivers/firmware/google/vpd.c
index 619f4bae474f..2a1b0040a220 100644
--- a/drivers/firmware/google/vpd.c
+++ b/drivers/firmware/google/vpd.c
@@ -116,9 +116,13 @@ static int vpd_section_attrib_add(const u8 *key, s32 key_len,
 		return VPD_OK;
 
 	info = kzalloc(sizeof(*info), GFP_KERNEL);
-	info->key = kzalloc(key_len + 1, GFP_KERNEL);
-	if (!info->key)
+	if (!info)
 		return -ENOMEM;
+	info->key = kzalloc(key_len + 1, GFP_KERNEL);
+	if (!info->key) {
+		ret = -ENOMEM;
+		goto free_info;
+	}
 
 	memcpy(info->key, key, key_len);
 
@@ -135,12 +139,17 @@ static int vpd_section_attrib_add(const u8 *key, s32 key_len,
 	list_add_tail(&info->list, &sec->attribs);
 
 	ret = sysfs_create_bin_file(sec->kobj, &info->bin_attr);
-	if (ret) {
-		kfree(info->key);
-		return ret;
-	}
+	if (ret)
+		goto free_info_key;
 
 	return 0;
+
+free_info_key:
+	kfree(info->key);
+free_info:
+	kfree(info);
+
+	return ret;
 }
 
 static void vpd_section_attrib_destroy(struct vpd_section *sec)
-- 
2.11.0

