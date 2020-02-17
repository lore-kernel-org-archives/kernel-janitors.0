From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Feb 2020 22:24:10 +0000
Subject: Re: [PATCH] dmaengine: coh901318: Fix a double lock bug in dma_tc_handle()
Message-Id: <CAMuHMdWaCqZ_zcHuBetAQu4kmoffNw5jvHM5ciTi29MAxL70bg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200217144050.3i4ymbytogod4ijn@kili.mountain>
In-Reply-To: <20200217144050.3i4ymbytogod4ijn@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Linus Walleij <linus.walleij@stericsson.com>, kernel-janitors@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Jia-Ju Bai <baijiaju1990@gmail.com>, dmaengine <dmaengine@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>

Hi Dan,

On Mon, Feb 17, 2020 at 3:41 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> The caller is already holding the lock so this will deadlock.
>
> Fixes: 0b58828c923e ("DMAENGINE: COH 901 318 remove irq counting")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is the second double lock bug found using static analysis.  The
> previous one was commit 627469e4445b ("dmaengine: coh901318: Fix a
> double-lock bug").
>
> The fact that this has been broken for ten years suggests that no one
> has the hardware.

Or this only runs CONFIG_SMP=n kernels?
This seems to be used in arch/arm/boot/dts/ste-u300.dts only, and
CONFIG_ARCH_U300 is a ARCH_MULTI_V5 platform, which looks like
it doesn't support SMP?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
