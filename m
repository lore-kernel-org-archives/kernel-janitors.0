From: Jonas Gorski <jogo@openwrt.org>
Date: Fri, 04 Jul 2014 21:52:51 +0000
Subject: Re: [PATCH] MIPS: Fix incorrect NULL check in local_flush_tlb_page()
Message-Id: <CAOiHx==mR0eioTk=tc457z4ANbhFR2vS2A2y3wzw119jnCi2Pw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1404493623-22705-1-git-send-email-emilgoode@gmail.com>
In-Reply-To: <1404493623-22705-1-git-send-email-emilgoode@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Emil Goode <emilgoode@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, John Crispin <blogic@openwrt.org>, MIPS Mailing List <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Jul 4, 2014 at 7:07 PM, Emil Goode <emilgoode@gmail.com> wrote:
> We check that the struct vm_area_struct pointer vma is NULL and
> then dereference it. The intent must have been to check that
> vma is not NULL before we dereference it in the next condition.

Actually if it is NULL, then it will short-cut and won't dereference
it (because !vma is true it can never become false again), so the
condition would be fine previously.

But, looking at the code a few lines into branch:

        if (!vma || cpu_context(cpu, vma->vm_mm) != 0) {
                unsigned long flags;
                int oldpid, newpid, idx;

#ifdef DEBUG_TLB
                printk("[tlbpage<%lu,0x%08lx>]", cpu_context(cpu,
vma->vm_mm), page);
#endif
                newpid = cpu_context(cpu, vma->vm_mm) & ASID_MASK;

it will be then dereferenced here, so the change is actually sensible,
even if the description isn't quite spot-on where it breaks.


Jonas
