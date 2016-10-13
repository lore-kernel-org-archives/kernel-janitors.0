From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Oct 2016 08:51:37 +0000
Subject: [patch] efi: fix an error code
Message-Id: <20161013085137.GD16198@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Fleming <matt-mF/unelCI9GS6iBeEJttW/XRex20P6io@public.gmane.org>, Octavian Purdila <octavian.purdila-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: linux-efi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

We should return -ENOMEM here, instead of success.

Fixes: 475fb4e8b2f4 ('efi / ACPI: load SSTDs from EFI variables')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index 1ac199c..a4944e2 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -259,8 +259,10 @@ static __init int efivar_ssdt_load(void)
 		}
 
 		data = kmalloc(size, GFP_KERNEL);
-		if (!data)
+		if (!data) {
+			ret = -ENOMEM;
 			goto free_entry;
+		}
 
 		ret = efivar_entry_get(entry, NULL, &size, data);
 		if (ret) {
