From: Joe Damato <ice799@gmail.com>
Date: Sat, 25 Oct 2008 03:15:32 +0000
Subject: [PATCH 12/12] x86: Use struct fields instead of bitmasks
Message-Id: <434766d4b5b6c08a3665c19038daaa3c1fa04cb0.1224903713.git.ice799@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <>
 <1224904532-9586-1-git-send-email-ice799@gmail.com>
 <52f8491fb5d55c0171840b01638ea6db0a98f3be.1224903712.git.ice799@gmail.com>
 <03269a2e8f455b431612a32e8cce048e98c75b27.1224903712.git.ice799@gmail.com>
 <4810cc08c12cd78612b53f9b52d7ba93a9b03fd0.1224903712.git.ice799@gmail.com>
 <a9cabc5cabdb5a10631e2a6dc330c54826f2b210.1224903712.git.ice799@gmail.com>
 <a4c806abcf7a46c78aaff4e338fdbc1a06a56c88.1224903712.git.ice799@gmail.com>
 <8834ad1ab5a5ab9b4902ab708160b23f078f3758.1224903712.git.ice799@gmail.com>
 <4d0ab6d642a4edc3ecc7367df7043ecc8f0a7f98.1224903712.git.ice799@gmail.com>
 <c53b3a54b3215187055dfe5673e1351d1bd3957a.1224903712.git.ice799@gmail.com>
 <e1bbf5a92bbf8fcf36dcbb650ee5f22d48d4b0f4.1224903712.git.ice799@gmail.com>
 <63f6f0d8b3da967e88094b6cd4b23f2ba78abbdc.1224903712.git.ice799@gmail.com>
 <0df5b7f8e2bee4a3599d6b80ea344b69d4bb4dc6.1224903713.git.ice799@gmail.com>
In-Reply-To: <0df5b7f8e2bee4a3599d6b80ea344b69d4bb4dc6.1224903713.git.ice799@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-x86_64@vger.kernel.org, linux-newbie@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Joe Damato <ice799@gmail.com>

Use fields in structs instead of bitmasks for getting/setting descriptor data.

Signed-off-by: Joe Damato <ice799@gmail.com>
---
 drivers/lguest/interrupts_and_traps.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/lguest/interrupts_and_traps.c b/drivers/lguest/interrupts_and_traps.c
index bfb24d9..0d9c065 100644
--- a/drivers/lguest/interrupts_and_traps.c
+++ b/drivers/lguest/interrupts_and_traps.c
@@ -178,7 +178,7 @@ void maybe_do_interrupt(struct lg_cpu *cpu)
 	 * over them. */
 	idt = &cpu->arch.idt[FIRST_EXTERNAL_VECTOR+irq];
 	/* If they don't have a handler (yet?), we just ignore it */
-	if (idt_present(idt->a, idt->b)) {
+	if (idt->p) {
 		/* OK, mark it no longer pending and deliver it. */
 		clear_bit(irq, cpu->irqs_pending);
 		/* set_guest_interrupt() takes the interrupt descriptor and a
@@ -254,7 +254,7 @@ int deliver_trap(struct lg_cpu *cpu, unsigned int num)
 
 	/* Early on the Guest hasn't set the IDT entries (or maybe it put a
 	 * bogus one in): if we fail here, the Guest will be killed. */
-	if (!idt_present(cpu->arch.idt[num].a, cpu->arch.idt[num].b))
+	if (!cpu->arch.idt[num].p)
 		return 0;
 	set_guest_interrupt(cpu, desc_lo(cpu->arch.idt[num]),
 			    desc_hi(cpu->arch.idt[num]), has_err(num));
@@ -461,7 +461,7 @@ void copy_traps(const struct lg_cpu *cpu, gate_desc *idt,
 		 * If it can't go direct, we still need to copy the priv. level:
 		 * they might want to give userspace access to a software
 		 * interrupt. */
-		if (idt_type(gidt->a, gidt->b) = 0xF)
+		if (gidt->type = 0xF)
 			idt[i] = *gidt;
 		else
 			default_idt_entry(&idt[i], i, def[i], gidt);
-- 
1.5.4.3

