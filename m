From: "Mike D. Day" <ncmike@us.ibm.com>
Date: Wed, 01 Nov 2006 13:45:40 +0000
Subject: [KJ] [PATCH] x86_64: remove unused variable
Message-Id: <20061101134540.GB26426@silverwood.ncultra.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

commit 8108bc5a1d1fe34bcefd5f173d9082ae3dd498c2
Author: Mike Day <mdday@core.silverwood.home>
Date:   Wed Nov 1 08:22:45 2006 -0500

    remove unused variable.
    
    Signed-off-by: Mike D. Day <ncmike@us.ibm.com>

diff --git a/arch/x86_64/kernel/io_apic.c b/arch/x86_64/kernel/io_apic.c
index fe429e5..7807228 100644
--- a/arch/x86_64/kernel/io_apic.c
+++ b/arch/x86_64/kernel/io_apic.c
@@ -688,7 +688,6 @@ void __setup_vector_irq(int cpu)
 {
 	/* Initialize vector_irq on a new cpu */
 	/* This function must be called with vector_lock held */
-	unsigned long flags;
 	int irq, vector;
 
 


-- 
Mike D. Day
IBM LTC
Cell: 919 412-3900
Sametime: ncmike@us.ibm.com AIM: ncmikeday  Yahoo: ultra.runner
PGP key: http://www.ncultra.org/ncmike/pubkey.asc
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
