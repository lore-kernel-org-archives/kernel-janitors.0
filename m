From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 25 Aug 2016 11:30:48 +0000
Subject: [PATCH] xen/grant-table: Use kmalloc_array() in arch_gnttab_valloc()
Message-Id: <8a04e3d1-2756-9e3a-e5ba-f5d0e6495df7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: xen-devel@lists.xenproject.org, x86@kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Vrabel <david.vrabel@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 25 Aug 2016 13:23:06 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus reuse the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data type by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/x86/xen/grant-table.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/xen/grant-table.c b/arch/x86/xen/grant-table.c
index de4144c..809b6c8 100644
--- a/arch/x86/xen/grant-table.c
+++ b/arch/x86/xen/grant-table.c
@@ -89,7 +89,7 @@ void arch_gnttab_unmap(void *shared, unsigned long nr_gframes)
 
 static int arch_gnttab_valloc(struct gnttab_vm_area *area, unsigned nr_frames)
 {
-	area->ptes = kmalloc(sizeof(pte_t *) * nr_frames, GFP_KERNEL);
+	area->ptes = kmalloc_array(nr_frames, sizeof(*area->ptes), GFP_KERNEL);
 	if (area->ptes = NULL)
 		return -ENOMEM;
 
-- 
2.9.3

