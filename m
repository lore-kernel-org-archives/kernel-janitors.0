From: Emil Goode <emilgoode@gmail.com>
Date: Sat, 05 Jul 2014 22:50:34 +0000
Subject: Re: [PATCH v2] MIPS: Fix incorrect NULL check in local_flush_tlb_page()
Message-Id: <20140705225034.GA12090@lianli>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1404584812-12377-1-git-send-email-emilgoode@gmail.com>
 <CAOiHx=nU7GvGnwrH0TqTkO9-mhX2RJU5gPzRRwb1OfHPcHmrqA@mail.gmail.com>
In-Reply-To: <CAOiHx=nU7GvGnwrH0TqTkO9-mhX2RJU5gPzRRwb1OfHPcHmrqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonas Gorski <jogo@openwrt.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, John Crispin <blogic@openwrt.org>, MIPS Mailing List <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hello,

On Sat, Jul 05, 2014 at 09:10:44PM +0200, Jonas Gorski wrote:
> On Sat, Jul 5, 2014 at 8:26 PM, Emil Goode <emilgoode@gmail.com> wrote:
> > We check that the struct vm_area_struct pointer vma is NULL and then
> > dereference it a few lines below. The intent must have been to make sure
> > that vma is not NULL and then to check the value from cpu_context() for
> > the condition to be true.
> >
> > Signed-off-by: Emil Goode <emilgoode@gmail.com>
> > ---
> >
> > v2: Updated the commit message with a better explanation.
> >
> >  arch/mips/mm/tlb-r3k.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/mips/mm/tlb-r3k.c b/arch/mips/mm/tlb-r3k.c
> > index d657493..6546758 100644
> > --- a/arch/mips/mm/tlb-r3k.c
> > +++ b/arch/mips/mm/tlb-r3k.c
> > @@ -158,7 +158,7 @@ void local_flush_tlb_page(struct vm_area_struct *vma, unsigned long page)
> >  {
> >         int cpu = smp_processor_id();
> >
> > -       if (!vma || cpu_context(cpu, vma->vm_mm) != 0) {
> > +       if (vma && cpu_context(cpu, vma->vm_mm) != 0) {
> 
> Sorry for replying "too late", but grepping through the kernel code I
> fail to find any caller that does not dereference vma before calling
> (local)flush_tlb_page(). Also both tlb-4k and tlb-8k assume vma cannot
> be NULL, so I would say it is safe to assume vma is never NULL, and
> the NULL check can be removed completely.
> 
> Also it looks like this "bug" was there since at least 2.6.12, and
> never seem to have bitten anyone.

Yes, the bug pre-dates GIT history and I agree that it is most unlikely
that it ever caused a problem. I will send a new patch that removes the
NULL check of vma.

Best regards,

Emil Goode
