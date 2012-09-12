From: Amos Kong <akong@redhat.com>
Date: Wed, 12 Sep 2012 05:58:22 +0000
Subject: Re: [kvm:next 1/1] arch/x86/kvm/emulate.c:232 writeback_registers() error: buffer overflow 'ctxt->_r
Message-Id: <5050247E.3070905@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120911143136.GA5736@localhost>
In-Reply-To: <20120911143136.GA5736@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Avi Kivity <avi@redhat.com>, kernel-janitors@vger.kernel.org, kvm@vger.kernel.org

On 11/09/12 22:31, Fengguang Wu wrote:
> Hi Avi,
>
> In the kvm/next branch, sparse warns about
>
> arch/x86/kvm/emulate.c:232 writeback_registers() error: buffer overflow 'ctxt->_regs' 9 <= 15
>
> This is because the array definition is ctxt._regs[NR_VCPU_REGS] where
> NR_VCPU_REGS=9 for i386 and 17 for x86_64.
>
> It could be fixed by changing the hard coded 16 to (NR_VCPU_REGS-1).

Hi Fengguang,

You replaced 16 to NR_VCPU_REGS in your patch, not (NR_VCPU_REGS-1).
I guess it's a mistake in your commitlog, right?


> And I wonder whether you actually want NR_VCPU_REGS here?
>
> Thanks,
> Fengguang
> ---
> --- linux-next.orig/arch/x86/kvm/emulate.c	2012-09-11 20:14:00.537475301 +0800
> +++ linux-next/arch/x86/kvm/emulate.c	2012-09-11 22:21:57.569227558 +0800
> @@ -228,7 +228,7 @@ static void writeback_registers(struct x
>   {
>   	unsigned reg;
>
> -	for_each_set_bit(reg, (ulong *)&ctxt->regs_dirty, 16)
> +	for_each_set_bit(reg, (ulong *)&ctxt->regs_dirty, NR_VCPU_REGS)


>   		ctxt->ops->write_gpr(ctxt, reg, ctxt->_regs[reg]);
>   }
>


-- 
			Amos.
