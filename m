From: "Thomas Hisch" <t.hisch@gmail.com>
Date: Sat, 10 Feb 2007 10:01:13 +0000
Subject: Re: [KJ] [PATCH] format specifier for the cpu number -> %u
Message-Id: <8ef77f2e0702100201k43599315k1d27e6489899e8da@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070209221521.GA3026@unknown-00-0d-60-79-ca-00.lan>
In-Reply-To: <20070209221521.GA3026@unknown-00-0d-60-79-ca-00.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/9/07, Thomas Hisch <t.hisch@gmail.com> wrote:
> changed format specifier for the cpu number in printk to %u
> in arch/i386/kernel/cpu/mcheck/*
>
> Signed-off-by: Thomas Hisch <t.hisch@gmail.com>
> ---
>
> this is only a part of my cpu to unsigned int patch,
> which i think should be ok
>
> imho the CPU#%u format in printk's is the best for cpu numbers,
> so this format should be the default in the whole kernel
>
> thoughts ?
>
[snip]
>         set_in_cr4 (X86_CR4_MCE);
> -       printk (KERN_INFO "Intel machine check reporting enabled on CPU#%d.\n",
> +       printk (KERN_INFO "Intel machine check reporting enabled on CPU#%u.\n",
>                 smp_processor_id());
>
>         /* Check for P4/Xeon extended MCE MSRs */
>         rdmsr (MSR_IA32_MCG_CAP, l, h);
>         if (l & (1<<9)) {/* MCG_EXT_P */
>                 mce_num_extended_msrs = (l >> 16) & 0xff;
> -               printk (KERN_INFO "CPU%d: Intel P4/Xeon Extended MCE MSRs (%d)"
> +               printk (KERN_INFO "CPU%u: Intel P4/Xeon Extended MCE MSRs (%d)"

it looks like i forgot to add the # in here. i'll fix this asap.

Thomas
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
