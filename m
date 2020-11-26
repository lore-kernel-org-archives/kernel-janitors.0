From: Andy Lutomirski <luto@kernel.org>
Date: Thu, 26 Nov 2020 19:15:54 +0000
Subject: Re: [PATCH] x86/cpu: correct values for GDT_ENTRY_INIT
Message-Id: <CALCETrUyoaJyJ8mGpq9bdanKKfHgjg_1B=N0rtmuHCmCP9Q9=g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201126115459.28980-1-lukas.bulwahn@gmail.com>
 <947b02eb-536f-16a0-fbb1-87b62ab8c13e@citrix.com> <CAKXUXMybmC=JE3uDnekAuHfRUZcrzSLJ04xB3nR=3BqHCsNVqA@mail.gmail.com>
In-Reply-To: <CAKXUXMybmC=JE3uDnekAuHfRUZcrzSLJ04xB3nR=3BqHCsNVqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, X86 ML <x86@kernel.org>, Akinobu Mita <akinobu.mita@gmail.com>, Joerg Roedel <jroedel@suse.de>, "H . Peter Anvin" <hpa@zytor.com>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, Nov 26, 2020 at 11:07 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Thu, Nov 26, 2020 at 6:16 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >
> > On 26/11/2020 11:54, Lukas Bulwahn wrote:
> > > Commit 1e5de18278e6 ("x86: Introduce GDT_ENTRY_INIT()") unintentionally
> > > transformed a few 0xffff values to 0xfffff (note: five times "f" instead of
> > > four) as part of the refactoring.
> >
> > The transformation in that change is correct.
> >
> > Segment bases are 20 bits wide in x86, but the top nibble is folded into
> > the middle of the attributes, which is why the transformation also has
> > xfxx => x0xx for the attributes field.
> >
> > >
> > > A quick check with:
> > >
> > >   git show 1e5de18278e6 | grep "fffff"
> > >
> > > reveals all those 14 occurrences:
> > >
> > >     12 in ./arch/x86/kernel/cpu/common.c, and
> > >     2  in ./arch/x86/include/asm/lguest.h.
> > >
> > > The two occurrences in ./arch/x86/include/asm/lguest.h were deleted with
> > > commit ecda85e70277 ("x86/lguest: Remove lguest support").
> > > Correct the remaining twelve occurrences in ./arch/x86/kernel/cpu/common.c
> > > back to the original values in the source code before the refactoring.
> > >
> > > Commit 866b556efa12 ("x86/head/64: Install startup GDT") probably simply
> > > copied the required startup gdt information from
> > > ./arch/x86/kernel/cpu/common.c to ./arch/x86/kernel/head64.c.
> > > So, correct those three occurrences in ./arch/x86/kernel/head64.c as well.
> > >
> > > As this value is truncated anyway, the object code has not changed when
> > > introducing the mistake and is also not changed with this correction now.
> > >
> > > This was discovered with sparse, which warns with:
> > >
> > >   warning: cast truncates bits from constant value (fffff becomes ffff)
> >
> > Does:
> >
> > diff --git a/arch/x86/include/asm/desc_defs.h
> > b/arch/x86/include/asm/desc_defs.h
> > index f7e7099af595..9561f3c66e9e 100644
> > --- a/arch/x86/include/asm/desc_defs.h
> > +++ b/arch/x86/include/asm/desc_defs.h
> > @@ -22,7 +22,7 @@ struct desc_struct {
> >
> >  #define GDT_ENTRY_INIT(flags, base, limit)                     \
> >         {                                                       \
> > -               .limit0         = (u16) (limit),                \
> > +               .limit0         = (u16) (limit) & 0xFFFF,       \
> >                 .limit1         = ((limit) >> 16) & 0x0F,       \
> >                 .base0          = (u16) (base),                 \
> >                 .base1          = ((base) >> 16) & 0xFF,        \
> >
> > fix the warning?
> >
>
> Thanks, I will try that out, and try compiling a 32-bit kernel as well.

You should also try comparing the objdump output before and after your
patch.  objdump -D will produce bizarre output but should work.
