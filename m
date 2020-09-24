From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Sep 2020 07:35:30 +0000
Subject: Re: [PATCH v2] soc: renesas: rmobile-sysc: Fix some leaks in rmobile_init_pm_domains()
Message-Id: <CAMuHMdVgZTLExon1JCDmAZaM+iB_yngTQvoXEuFYw7fRF39aGw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAMuHMdXyM1dUPJ7ZDAk6-cEjaG_bVBfsE=bqdpf7pA0ChdRLVw@mail.gmail.com>
 <20200923113142.GC1473821@mwanda>
In-Reply-To: <20200923113142.GC1473821@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Simon Horman <horms+renesas@verge.net.au>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Sep 23, 2020 at 1:31 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> This code needs to call iounmap() on one error path.
>
> Fixes: 2173fc7cb681 ("ARM: shmobile: R-Mobile: Add DT support for PM domains")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2:  The v1 patch potentially led to a use after free.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.11.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
