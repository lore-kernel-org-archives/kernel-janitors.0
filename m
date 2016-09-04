From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 04 Sep 2016 19:45:08 +0000
Subject: [PATCH] x86/hpet: Use kmalloc_array() in hpet_enable()
Message-Id: <ed804ee9-97cb-f401-06ec-3f0f8ac6889e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: x86@kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@suse.de>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jan Beulich <JBeulich@suse.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 4 Sep 2016 21:30:10 +0200

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "kmalloc_array".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/x86/kernel/hpet.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/hpet.c b/arch/x86/kernel/hpet.c
index c6dfd80..3c2030d 100644
--- a/arch/x86/kernel/hpet.c
+++ b/arch/x86/kernel/hpet.c
@@ -876,8 +876,9 @@ int __init hpet_enable(void)
 #endif
 
 	cfg = hpet_readl(HPET_CFG);
-	hpet_boot_cfg = kmalloc((last + 2) * sizeof(*hpet_boot_cfg),
-				GFP_KERNEL);
+	hpet_boot_cfg = kmalloc_array(last + 2,
+				      sizeof(*hpet_boot_cfg),
+				      GFP_KERNEL);
 	if (hpet_boot_cfg)
 		*hpet_boot_cfg = cfg;
 	else
-- 
2.9.3

