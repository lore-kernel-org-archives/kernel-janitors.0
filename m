From: "Alexander Beregalov" <a.beregalov@gmail.com>
Date: Sun, 06 Jul 2008 16:13:49 +0000
Subject: [PATCH] x86 setup.c: cleanup includes
Message-Id: <a4423d670807060913red9187bj7bcc886d1fb20ad3@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mingo@elte.hu, yhlu.kernel@gmail.com, tglx@linutronix.de, hpa@zytor.com, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

From: Alexander Beregalov <a.beregalov@gmail.com>

The patch applies to the linux-next tree.


x86: remove double includes in setup.c

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index 3c98693..f4c9b58 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -57,12 +57,8 @@
 #include <linux/slab.h>
 #include <linux/user.h>
 #include <linux/delay.h>
-#include <linux/highmem.h>

 #include <linux/kallsyms.h>
-#include <linux/edd.h>
-#include <linux/iscsi_ibft.h>
-#include <linux/kexec.h>
 #include <linux/cpufreq.h>
 #include <linux/dma-mapping.h>
 #include <linux/ctype.h>
@@ -104,7 +100,6 @@
 #include <asm/paravirt.h>

 #include <asm/percpu.h>
-#include <asm/sections.h>
 #include <asm/topology.h>
 #include <asm/apicdef.h>
 #ifdef CONFIG_X86_64
