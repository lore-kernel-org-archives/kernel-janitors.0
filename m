From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Oct 2016 08:55:42 +0000
Subject: Re: [PATCH 4/4] MIPS/kernel/proc: Combine four seq_printf() calls into one call in show_cpuinfo()
Message-Id: <CAMuHMdXn2gss2MRP7j1pAcmcXL_VivGQqMw1mAu-PUaRxGER0w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3809e713-2f08-db60-92c1-21d735a4f35b@users.sourceforge.net> <61796ee0-b3b8-53a6-d29d-487c89145fc1@users.sourceforge.net>
In-Reply-To: <61796ee0-b3b8-53a6-d29d-487c89145fc1@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Linux MIPS Mailing List <linux-mips@linux-mips.org>, Andrea Gelmini <andrea.gelmini@gelma.net>, Andrew Morton <akpm@linux-foundation.org>, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Matt Redfearn <matt.redfearn@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, =?UTF-8?B?UmFsZiBCw6RjaGxl?= <ralf@linux-mips.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Mon, Oct 24, 2016 at 2:30 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 24 Oct 2016 13:54:58 +0200
>
> Some data were printed into a sequence by four separate function calls.
> Print the same data by one function call instead.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/mips/kernel/proc.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
> index 07480a9..1047a03 100644
> --- a/arch/mips/kernel/proc.c
> +++ b/arch/mips/kernel/proc.c
> @@ -142,12 +142,15 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>                 seq_printf(m, "micromips kernel\t: %s\n",
>                       (read_c0_config3() & MIPS_CONF3_ISA_OE) ?  "yes" : "no");
>         }
> -       seq_printf(m, "shadow register sets\t: %d\n",
> -                     cpu_data[n].srsets);
> -       seq_printf(m, "kscratch registers\t: %d\n",
> -                     hweight8(cpu_data[n].kscratch_mask));
> -       seq_printf(m, "package\t\t\t: %d\n", cpu_data[n].package);
> -       seq_printf(m, "core\t\t\t: %d\n", cpu_data[n].core);
> +       seq_printf(m,
> +                  "shadow register sets\t: %d\n"
> +                  "kscratch registers\t: %d\n"
> +                  "package\t\t\t: %d\n"
> +                  "core\t\t\t: %d\n",
> +                  cpu_data[n].srsets,
> +                  hweight8(cpu_data[n].kscratch_mask),
> +                  cpu_data[n].package,
> +                  cpu_data[n].core);

I think the code is much easier to read with separate seq_printf()s for
each line printed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
