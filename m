From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2020 09:10:17 +0000
Subject: Re: [PATCH] soc: renesas: rmobile-sysc: Fix some leaks in rmobile_init_pm_domains()
Message-Id: <CAMuHMdXyM1dUPJ7ZDAk6-cEjaG_bVBfsE=bqdpf7pA0ChdRLVw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200923084458.GD1454948@mwanda>
In-Reply-To: <20200923084458.GD1454948@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms+renesas@verge.net.au>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Dan,

On Wed, Sep 23, 2020 at 10:47 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> This code needs to call iounmap() on the error paths.

Thanks for your patch!

> Fixes: 2ed29e15e4b2 ("ARM: shmobile: R-Mobile: Move pm-rmobile to drivers/soc/renesas/")

This is not the commit that introduced the issue.

Fixes: 2173fc7cb681c38b ("ARM: shmobile: R-Mobile: Add DT support for
PM domains")

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

> --- a/drivers/soc/renesas/rmobile-sysc.c
> +++ b/drivers/soc/renesas/rmobile-sysc.c
> @@ -328,6 +328,7 @@ static int __init rmobile_init_pm_domains(void)
>                 pmd = of_get_child_by_name(np, "pm-domains");
>                 if (!pmd) {
>                         pr_warn("%pOF lacks pm-domains node\n", np);
> +                       iounmap(base);

This one I can agree with, although that case is a bug in the DTS.

>                         continue;
>                 }
>
> @@ -341,6 +342,7 @@ static int __init rmobile_init_pm_domains(void)
>                 of_node_put(pmd);
>                 if (ret) {
>                         of_node_put(np);
> +                       iounmap(base);

This one I cannot: in the (unlikely, only if OOM) case
rmobile_add_pm_domains() returns an error, one or more PM subdomains may
have been registered already.  Hence if you call iounmap() here, the
code will try to access unmapped registers later, leading to a crash.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
