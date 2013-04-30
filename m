From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 30 Apr 2013 07:43:44 +0000
Subject: [patch] efi: remove "kfree(NULL)"
Message-Id: <20130430074344.GE7237@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Fleming <matt.fleming-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: linux-efi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

No need to free a NULL pointer.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/firmware/efi/efivars.c b/drivers/firmware/efi/efivars.c
index 66928a3..7067b56 100644
--- a/drivers/firmware/efi/efivars.c
+++ b/drivers/firmware/efi/efivars.c
@@ -420,10 +420,8 @@ efivar_create_sysfs_entry(struct efivar_entry *new_var)
 
 	short_name = kzalloc(short_name_size, GFP_KERNEL);
 
-	if (!short_name) {
-		kfree(short_name);
+	if (!short_name)
 		return 1;
-	}
 
 	/* Convert Unicode to normal chars (assume top bits are 0),
 	   ala UTF-8 */
