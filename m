From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 11 Mar 2018 08:16:47 +0000
Subject: [PATCH] powerpc: Use common error handling code in setup_new_fdt()
Message-Id: <0dd9d938-8d89-f0e0-f05f-9a3e5dc42a57@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Borislav Petkov <bp@suse.de>, Brijesh Singh <brijesh.singh@amd.com>, Josh Sklar <sklar@linux.vnet.ibm.com>, Kees Cook <keescook@chromium.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky <thomas.lendacky@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 11 Mar 2018 09:03:42 +0100

Add a jump target so that a bit of exception handling can be better reused
at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/kernel/machine_kexec_file_64.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/kernel/machine_kexec_file_64.c b/arch/powerpc/kernel/machine_kexec_file_64.c
index e4395f937d63..90c6004c2eec 100644
--- a/arch/powerpc/kernel/machine_kexec_file_64.c
+++ b/arch/powerpc/kernel/machine_kexec_file_64.c
@@ -302,18 +302,14 @@ int setup_new_fdt(const struct kimage *image, void *fdt,
 		ret = fdt_setprop_u64(fdt, chosen_node,
 				      "linux,initrd-start",
 				      initrd_load_addr);
-		if (ret < 0) {
-			pr_err("Error setting up the new device tree.\n");
-			return -EINVAL;
-		}
+		if (ret < 0)
+			goto report_setup_failure;
 
 		/* initrd-end is the first address after the initrd image. */
 		ret = fdt_setprop_u64(fdt, chosen_node, "linux,initrd-end",
 				      initrd_load_addr + initrd_len);
-		if (ret < 0) {
-			pr_err("Error setting up the new device tree.\n");
-			return -EINVAL;
-		}
+		if (ret < 0)
+			goto report_setup_failure;
 
 		ret = fdt_add_mem_rsv(fdt, initrd_load_addr, initrd_len);
 		if (ret) {
@@ -325,10 +321,8 @@ int setup_new_fdt(const struct kimage *image, void *fdt,
 
 	if (cmdline != NULL) {
 		ret = fdt_setprop_string(fdt, chosen_node, "bootargs", cmdline);
-		if (ret < 0) {
-			pr_err("Error setting up the new device tree.\n");
-			return -EINVAL;
-		}
+		if (ret < 0)
+			goto report_setup_failure;
 	} else {
 		ret = fdt_delprop(fdt, chosen_node, "bootargs");
 		if (ret && ret != -FDT_ERR_NOTFOUND) {
@@ -344,10 +338,12 @@ int setup_new_fdt(const struct kimage *image, void *fdt,
 	}
 
 	ret = fdt_setprop(fdt, chosen_node, "linux,booted-from-kexec", NULL, 0);
-	if (ret) {
-		pr_err("Error setting up the new device tree.\n");
-		return -EINVAL;
-	}
+	if (ret)
+		goto report_setup_failure;
 
 	return 0;
+
+report_setup_failure:
+	pr_err("Error setting up the new device tree.\n");
+	return -EINVAL;
 }
-- 
2.16.2

