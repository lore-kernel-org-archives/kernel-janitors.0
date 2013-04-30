From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 30 Apr 2013 07:43:12 +0000
Subject: [patch] efi: locking fix in efivar_entry_set_safe()
Message-Id: <20130430074312.GD7237@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Fleming <matt.fleming-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Tom Gundersen <teg-B22kvLQNl6c@public.gmane.org>
Cc: linux-efi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The intent is that if we aren't allowed to block because we're in an
NMI or an emergency then we only take the lock if it is uncontended.

Part of the problem is the test is reversed so we return -EBUSY if we
acquire the lock.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker stuff.  I haven't tested this.

diff --git a/drivers/firmware/efi/vars.c b/drivers/firmware/efi/vars.c
index 1d80c1c..f34d8fe 100644
--- a/drivers/firmware/efi/vars.c
+++ b/drivers/firmware/efi/vars.c
@@ -622,10 +622,12 @@ int efivar_entry_set_safe(efi_char16_t *name, efi_guid_t vendor, u32 attributes,
 	if (!ops->query_variable_store)
 		return -ENOSYS;
 
-	if (!block && spin_trylock_irqsave(&__efivars->lock, flags))
-		return -EBUSY;
-	else
+	if (!block) {
+		if (!spin_trylock_irqsave(&__efivars->lock, flags))
+			return -EBUSY;
+	} else {
 		spin_lock_irqsave(&__efivars->lock, flags);
+	}
 
 	status = check_var_size(attributes, size + ucs2_strsize(name, 1024));
 	if (status != EFI_SUCCESS) {
