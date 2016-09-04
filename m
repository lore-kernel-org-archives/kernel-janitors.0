From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 04 Sep 2016 20:23:12 +0000
Subject: [PATCH] x86-ksysfs: Use kmalloc_array() in create_setup_data_nodes()
Message-Id: <3b21b2d7-9856-009c-9bd1-3a76a83bc7fc@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: x86@kernel.org, Dave Young <dyoung@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Kees Cook <keescook@chromium.org>, Matt Fleming <matt.fleming@intel.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 4 Sep 2016 22:15:09 +0200

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "kmalloc_array".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/x86/kernel/ksysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/ksysfs.c b/arch/x86/kernel/ksysfs.c
index 4afc67f..cddf3c6 100644
--- a/arch/x86/kernel/ksysfs.c
+++ b/arch/x86/kernel/ksysfs.c
@@ -283,7 +283,7 @@ static int __init create_setup_data_nodes(struct kobject *parent)
 	if (ret)
 		goto out_setup_data_kobj;
 
-	kobjp = kmalloc(sizeof(*kobjp) * nr, GFP_KERNEL);
+	kobjp = kmalloc_array(nr, sizeof(*kobjp), GFP_KERNEL);
 	if (!kobjp) {
 		ret = -ENOMEM;
 		goto out_setup_data_kobj;
-- 
2.9.3

