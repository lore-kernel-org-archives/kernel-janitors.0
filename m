From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 11 Sep 2012 14:31:36 +0000
Subject: [kvm:next 1/1] arch/x86/kvm/emulate.c:232 writeback_registers() error: buffer overflow 'ctxt->_regs'
Message-Id: <20120911143136.GA5736@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Avi Kivity <avi@redhat.com>
Cc: kernel-janitors@vger.kernel.org, kvm@vger.kernel.org

Hi Avi,

In the kvm/next branch, sparse warns about

arch/x86/kvm/emulate.c:232 writeback_registers() error: buffer overflow 'ctxt->_regs' 9 <= 15

This is because the array definition is ctxt._regs[NR_VCPU_REGS] where
NR_VCPU_REGS=9 for i386 and 17 for x86_64.

It could be fixed by changing the hard coded 16 to (NR_VCPU_REGS-1).
And I wonder whether you actually want NR_VCPU_REGS here?

Thanks,
Fengguang
---
--- linux-next.orig/arch/x86/kvm/emulate.c	2012-09-11 20:14:00.537475301 +0800
+++ linux-next/arch/x86/kvm/emulate.c	2012-09-11 22:21:57.569227558 +0800
@@ -228,7 +228,7 @@ static void writeback_registers(struct x
 {
 	unsigned reg;
 
-	for_each_set_bit(reg, (ulong *)&ctxt->regs_dirty, 16)
+	for_each_set_bit(reg, (ulong *)&ctxt->regs_dirty, NR_VCPU_REGS)
 		ctxt->ops->write_gpr(ctxt, reg, ctxt->_regs[reg]);
 }
 
