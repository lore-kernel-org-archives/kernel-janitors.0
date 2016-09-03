From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 03 Sep 2016 12:21:40 +0000
Subject: [PATCH 07/17] s390/debug: Rename jump labels in debug_open()
Message-Id: <01ff43e5-7a28-0410-6c4a-8f7519cbdbca@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <e4359dc9-9e20-e33b-9743-9ebade853268@users.sourceforge.net>
In-Reply-To: <e4359dc9-9e20-e33b-9743-9ebade853268@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-s390@vger.kernel.org, David Hildenbrand <dahi@linux.vnet.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Joe Perches <joe@perches.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 1 Sep 2016 18:44:17 +0200

Adjust jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/s390/kernel/debug.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/s390/kernel/debug.c b/arch/s390/kernel/debug.c
index 1f32578..1cce76a 100644
--- a/arch/s390/kernel/debug.c
+++ b/arch/s390/kernel/debug.c
@@ -614,15 +614,13 @@ debug_open(struct inode *inode, struct file *file)
 			continue;
 		else if (debug_info->debugfs_entries[i] =
 			 file->f_path.dentry) {
-			goto found;	/* found view ! */
+			goto copy_info;
 		}
 	}
 	/* no entry found */
 	rc = -EINVAL;
-	goto out;
-
-found:
-
+	goto unlock;
+ copy_info:
 	/* Make snapshot of current debug areas to get it consistent.     */
 	/* To copy all the areas is only needed, if we have a view which  */
 	/* formats the debug areas. */
@@ -636,14 +634,14 @@ found:
 
 	if (!debug_info_snapshot) {
 		rc = -ENOMEM;
-		goto out;
+		goto unlock;
 	}
 	p_info = kmalloc(sizeof(file_private_info_t),
 						GFP_KERNEL);
 	if (!p_info) {
 		debug_info_free(debug_info_snapshot);
 		rc = -ENOMEM;
-		goto out;
+		goto unlock;
 	}
 	p_info->offset = 0;
 	p_info->debug_info_snap = debug_info_snapshot;
@@ -656,7 +654,7 @@ found:
 	file->private_data = p_info;
 	debug_info_get(debug_info);
 	nonseekable_open(inode, file);
-out:
+ unlock:
 	mutex_unlock(&debug_mutex);
 	return rc;
 }
-- 
2.9.3

