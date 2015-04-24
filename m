From: Firo Yang <firogm@gmail.com>
Date: Fri, 24 Apr 2015 06:07:19 +0000
Subject: [PATCH] x86/efi: fix potential NULL pointer dereference
Message-Id: <1429855639-14706-1-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: matt.fleming-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-efi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Firo Yang <firogm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

In this patch, I add error-handing code for kmalloc() in
arch/x86/platform/efi/efi_64.c::efi_call_phys_prolog().

If kmalloc() failed to alloc memroy, save_pgd will be a NULL
pointer dereferenced by subsequent codes.

Signed-off-by: Firo Yang <firogm@gmail.com>
---
 arch/x86/platform/efi/efi_64.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/platform/efi/efi_64.c b/arch/x86/platform/efi/efi_64.c
index a0ac0f9..62326c4 100644
--- a/arch/x86/platform/efi/efi_64.c
+++ b/arch/x86/platform/efi/efi_64.c
@@ -90,6 +90,8 @@ pgd_t * __init efi_call_phys_prolog(void)
 
 	n_pgds = DIV_ROUND_UP((max_pfn << PAGE_SHIFT), PGDIR_SIZE);
 	save_pgd = kmalloc(n_pgds * sizeof(pgd_t), GFP_KERNEL);
+	if (unlikely(!save_pgd))
+		return NULL;
 
 	for (pgd = 0; pgd < n_pgds; pgd++) {
 		save_pgd[pgd] = *pgd_offset_k(pgd * PGDIR_SIZE);
-- 
2.1.0

