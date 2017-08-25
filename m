From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 25 Aug 2017 10:33:40 +0000
Subject: [PATCH] powerpc/44x: mask and shift to zero bug
Message-Id: <20170825103340.op3uphrv3eyeutiz@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Matthias Fuchs <matthias.fuchs@esd-electronics.com>
Cc: Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

My static checker complains that 0x00001800 >> 13 is zero.  Looking at
the context, it seems like a copy and paste bug from the line below and
probably 0x3 << 13 or 0x00006000 was intended.

Fixes: 2af59f7d5c3e ("[POWERPC] 4xx: Add 405GPr and 405EP support in boot wrapper")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not tested!

diff --git a/arch/powerpc/boot/4xx.c b/arch/powerpc/boot/4xx.c
index 9d3bd4c45a24..f7da65169124 100644
--- a/arch/powerpc/boot/4xx.c
+++ b/arch/powerpc/boot/4xx.c
@@ -564,7 +564,7 @@ void ibm405gp_fixup_clocks(unsigned int sys_clk, unsigned int ser_clk)
 		fbdv = 16;
 	cbdv = ((pllmr & 0x00060000) >> 17) + 1; /* CPU:PLB */
 	opdv = ((pllmr & 0x00018000) >> 15) + 1; /* PLB:OPB */
-	ppdv = ((pllmr & 0x00001800) >> 13) + 1; /* PLB:PCI */
+	ppdv = ((pllmr & 0x00006000) >> 13) + 1; /* PLB:PCI */
 	epdv = ((pllmr & 0x00001800) >> 11) + 2; /* PLB:EBC */
 	udiv = ((cpc0_cr0 & 0x3e) >> 1) + 1;
 
