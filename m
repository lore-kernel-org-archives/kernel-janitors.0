From: Ralf Baechle <ralf@linux-mips.org>
Date: Tue, 25 Oct 2016 09:08:22 +0000
Subject: Re: [PATCH 4/4] MIPS/kernel/proc: Combine four seq_printf() calls into one call in show_cpuinfo()
Message-Id: <20161025090822.GB4795@linux-mips.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3809e713-2f08-db60-92c1-21d735a4f35b@users.sourceforge.net>
 <61796ee0-b3b8-53a6-d29d-487c89145fc1@users.sourceforge.net>
 <CAMuHMdXn2gss2MRP7j1pAcmcXL_VivGQqMw1mAu-PUaRxGER0w@mail.gmail.com>
In-Reply-To: <CAMuHMdXn2gss2MRP7j1pAcmcXL_VivGQqMw1mAu-PUaRxGER0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Andrea Gelmini <andrea.gelmini@gelma.net>, Andrew Morton <akpm@linux-foundation.org>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Matt Redfearn <matt.redfearn@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Tue, Oct 25, 2016 at 10:55:42AM +0200, Geert Uytterhoeven wrote:

> > -       seq_printf(m, "shadow register sets\t: %d\n",
> > -                     cpu_data[n].srsets);
> > -       seq_printf(m, "kscratch registers\t: %d\n",
> > -                     hweight8(cpu_data[n].kscratch_mask));
> > -       seq_printf(m, "package\t\t\t: %d\n", cpu_data[n].package);
> > -       seq_printf(m, "core\t\t\t: %d\n", cpu_data[n].core);
> > +       seq_printf(m,
> > +                  "shadow register sets\t: %d\n"
> > +                  "kscratch registers\t: %d\n"
> > +                  "package\t\t\t: %d\n"
> > +                  "core\t\t\t: %d\n",
> > +                  cpu_data[n].srsets,
> > +                  hweight8(cpu_data[n].kscratch_mask),
> > +                  cpu_data[n].package,
> > +                  cpu_data[n].core);
> 
> I think the code is much easier to read with separate seq_printf()s for
> each line printed.

Which is why I originally implemented this as separate function calls.
Code size and performance are hardly an argument for /proc/cpuinfo.

  Ralf
