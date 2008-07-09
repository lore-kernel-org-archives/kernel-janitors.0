From: "Alexander Beregalov" <a.beregalov@gmail.com>
Date: Wed, 09 Jul 2008 18:28:24 +0000
Subject: [PATCH -next] arch/x86/kernel/cpu/common_64.c: remove double inclusions
Message-Id: <a4423d670807091128t3a03b739y66fcffcfcf961f8@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mingo@elte.hu, yhlu.kernel@gmail.com, tglx@linutronix.de, hpa@zytor.com, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

From: Alexander Beregalov <a.beregalov@gmail.com>

x86: remove double inclusions in arch/x86/kernel/cpu/common_64.c


Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

diff --git a/arch/x86/kernel/cpu/common_64.c b/arch/x86/kernel/cpu/common_64.c
index 7518502..85cf7e1 100644
--- a/arch/x86/kernel/cpu/common_64.c
+++ b/arch/x86/kernel/cpu/common_64.c
@@ -7,12 +7,9 @@
 #include <linux/module.h>
 #include <linux/kgdb.h>
 #include <linux/topology.h>
-#include <linux/string.h>
 #include <linux/delay.h>
 #include <linux/smp.h>
-#include <linux/module.h>
 #include <linux/percpu.h>
-#include <asm/processor.h>
 #include <asm/i387.h>
 #include <asm/msr.h>
 #include <asm/io.h>
