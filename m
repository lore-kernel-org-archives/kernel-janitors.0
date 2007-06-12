From: Shani Moideen <shani.moideen@wipro.com>
Date: Tue, 12 Jun 2007 02:57:41 +0000
Subject: [KJ] [KJ PATCH] Replacing memcpy(dest,src,PAGE_SIZE) with
Message-Id: <1181616342.2282.8.camel@shani-win>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ebiederm@xmission.com
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

Hi,
Replacing memcpy(dest,src,PAGE_SIZE) with copy_page(dest,src) in arch/i386/kernel/machine_kexec.c.

Signed-off-by: Shani Moideen <shani.moideen@wipro.com>
----

diff --git a/arch/i386/kernel/machine_kexec.c b/arch/i386/kernel/machine_kexec.c
index 91966ba..ce79a44 100644
--- a/arch/i386/kernel/machine_kexec.c
+++ b/arch/i386/kernel/machine_kexec.c
@@ -110,7 +110,7 @@ NORET_TYPE void machine_kexec(struct kimage *image)
 	local_irq_disable();
 
 	control_page = page_address(image->control_code_page);
-	memcpy(control_page, relocate_kernel, PAGE_SIZE);
+	copy_page(control_page, relocate_kernel);
 
 	page_list[PA_CONTROL_PAGE] = __pa(control_page);
 	page_list[VA_CONTROL_PAGE] = (unsigned long)relocate_kernel;

-- 
Shani 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
