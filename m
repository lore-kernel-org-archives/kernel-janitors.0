From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 12 Sep 2012 06:07:10 +0000
Subject: Re: [kvm:next 1/1] arch/x86/kvm/emulate.c:232 writeback_registers() error: buffer overflow 'ctxt->_r
Message-Id: <20120912060710.GA24997@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120911143136.GA5736@localhost>
 <5050247E.3070905@redhat.com>
In-Reply-To: <5050247E.3070905@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amos Kong <akong@redhat.com>
Cc: Avi Kivity <avi@redhat.com>, kernel-janitors@vger.kernel.org, kvm@vger.kernel.org

On Wed, Sep 12, 2012 at 01:58:22PM +0800, Amos Kong wrote:
> On 11/09/12 22:31, Fengguang Wu wrote:
> >Hi Avi,
> >
> >In the kvm/next branch, sparse warns about
> >
> >arch/x86/kvm/emulate.c:232 writeback_registers() error: buffer overflow 'ctxt->_regs' 9 <= 15
> >
> >This is because the array definition is ctxt._regs[NR_VCPU_REGS] where
> >NR_VCPU_REGS=9 for i386 and 17 for x86_64.
> >
> >It could be fixed by changing the hard coded 16 to (NR_VCPU_REGS-1).
> 
> Hi Fengguang,
> 
> You replaced 16 to NR_VCPU_REGS in your patch, not (NR_VCPU_REGS-1).
> I guess it's a mistake in your commitlog, right?

16 = (NR_VCPU_REGS-1). So I mean, if replacing 16 with (NR_VCPU_REGS-1),
there will be no behavior change for the x86_64 case. However I
*suspect* the right value is (NR_VCPU_REGS), as I said in the below
sentence.

> >And I wonder whether you actually want NR_VCPU_REGS here?

For your convenience, here is the relevant code for NR_VCPU_REGS:

        enum kvm_reg {
                VCPU_REGS_RAX = 0,
                VCPU_REGS_RCX = 1,
                VCPU_REGS_RDX = 2,
                VCPU_REGS_RBX = 3,
                VCPU_REGS_RSP = 4,
                VCPU_REGS_RBP = 5,
                VCPU_REGS_RSI = 6,
                VCPU_REGS_RDI = 7,
        #ifdef CONFIG_X86_64
                VCPU_REGS_R8 = 8,
                VCPU_REGS_R9 = 9,
                VCPU_REGS_R10 = 10,
                VCPU_REGS_R11 = 11,
                VCPU_REGS_R12 = 12,
                VCPU_REGS_R13 = 13,
                VCPU_REGS_R14 = 14,
                VCPU_REGS_R15 = 15,
        #endif 
                VCPU_REGS_RIP,
=>             NR_VCPU_REGS
        };

Thanks,
Fengguang

> >--- linux-next.orig/arch/x86/kvm/emulate.c	2012-09-11 20:14:00.537475301 +0800
> >+++ linux-next/arch/x86/kvm/emulate.c	2012-09-11 22:21:57.569227558 +0800
> >@@ -228,7 +228,7 @@ static void writeback_registers(struct x
> >  {
> >  	unsigned reg;
> >
> >-	for_each_set_bit(reg, (ulong *)&ctxt->regs_dirty, 16)
> >+	for_each_set_bit(reg, (ulong *)&ctxt->regs_dirty, NR_VCPU_REGS)
> 
> 
> >  		ctxt->ops->write_gpr(ctxt, reg, ctxt->_regs[reg]);
> >  }
> >
> 
> 
> -- 
> 			Amos.
