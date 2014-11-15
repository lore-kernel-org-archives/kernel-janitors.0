From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 15 Nov 2014 18:57:18 +0000
Subject: [patch -next] x86/lguest: interrupt[] array size has changed
Message-Id: <20141115185718.GB6530@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Smatch complains that there is a buffer overflow here because we
recently changed interrupt[] from having "NR_VECTORS -
FIRST_EXTERNAL_VECTOR" elements to now have "FIRST_SYSTEM_VECTOR -
FIRST_EXTERNAL_VECTOR" elements.

Fixes: 8c66877ee65e ('x86: Avoid building unused IRQ entry stubs')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I can't actually compile this code, and I'm an lguest newbie.  Please
review this one carefully.

diff --git a/arch/x86/lguest/boot.c b/arch/x86/lguest/boot.c
index aae9413..c1c1544 100644
--- a/arch/x86/lguest/boot.c
+++ b/arch/x86/lguest/boot.c
@@ -841,7 +841,7 @@ static void __init lguest_init_IRQ(void)
 {
 	unsigned int i;
 
-	for (i = FIRST_EXTERNAL_VECTOR; i < NR_VECTORS; i++) {
+	for (i = FIRST_EXTERNAL_VECTOR; i < FIRST_SYSTEM_VECTOR; i++) {
 		/* Some systems map "vectors" to interrupts weirdly.  Not us! */
 		__this_cpu_write(vector_irq[i], i - FIRST_EXTERNAL_VECTOR);
 		if (i != SYSCALL_VECTOR)
