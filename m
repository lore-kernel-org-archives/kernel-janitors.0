From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 29 Aug 2016 11:07:37 +0000
Subject: [PATCH 1/5] powerpc-mpic: Use kmalloc_array() in mpic_init()
Message-Id: <8fe4b2fb-c27d-4932-bbcc-23899afa932d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <fe8faf9e-01bb-4f3e-8258-ecb37ba15c9f@users.sourceforge.net>
In-Reply-To: <fe8faf9e-01bb-4f3e-8258-ecb37ba15c9f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linuxppc-dev@lists.ozlabs.org, Adam Buchbinder <adam.buchbinder@gmail.com>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Marc Zyngier <marc.zyngier@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Scott Wood <scottwood@freescale.com>, Sudeep Holla <Sudeep.Holla@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 29 Aug 2016 11:00:11 +0200

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "kmalloc_array".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/sysdev/mpic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
index 7de45b2..5e79c0d24 100644
--- a/arch/powerpc/sysdev/mpic.c
+++ b/arch/powerpc/sysdev/mpic.c
@@ -1641,8 +1641,9 @@ void __init mpic_init(struct mpic *mpic)
 
 #ifdef CONFIG_PM
 	/* allocate memory to save mpic state */
-	mpic->save_data = kmalloc(mpic->num_sources * sizeof(*mpic->save_data),
-				  GFP_KERNEL);
+	mpic->save_data = kmalloc_array(mpic->num_sources,
+					sizeof(*mpic->save_data),
+					GFP_KERNEL);
 	BUG_ON(mpic->save_data = NULL);
 #endif
 
-- 
2.9.3

