From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Feb 2020 09:20:22 +0000
Subject: Re: [PATCH] dmaengine: coh901318: Fix a double lock bug in dma_tc_handle()
Message-Id: <CAMuHMdVC_=V6z+8GubgDvWR37zZdr8f3Fqs-KYUYdZ+e=wYCyg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200217144050.3i4ymbytogod4ijn@kili.mountain>
 <CAMuHMdWaCqZ_zcHuBetAQu4kmoffNw5jvHM5ciTi29MAxL70bg@mail.gmail.com> <20200219091754.GE2618@vkoul-mobl>
In-Reply-To: <20200219091754.GE2618@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vkoul@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Dan Carpenter <dan.carpenter@oracle.com>, kernel-janitors@vger.kernel.org, Jia-Ju Bai <baijiaju1990@gmail.com>, dmaengine <dmaengine@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>

Hi Vinod,

On Wed, Feb 19, 2020 at 10:18 AM Vinod Koul <vkoul@kernel.org> wrote:
> On 17-02-20, 23:24, Geert Uytterhoeven wrote:
> > On Mon, Feb 17, 2020 at 3:41 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > The caller is already holding the lock so this will deadlock.
> > >
> > > Fixes: 0b58828c923e ("DMAENGINE: COH 901 318 remove irq counting")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > > This is the second double lock bug found using static analysis.  The
> > > previous one was commit 627469e4445b ("dmaengine: coh901318: Fix a
> > > double-lock bug").
> > >
> > > The fact that this has been broken for ten years suggests that no one
> > > has the hardware.
> >
> > Or this only runs CONFIG_SMP=n kernels?
> > This seems to be used in arch/arm/boot/dts/ste-u300.dts only, and
> > CONFIG_ARCH_U300 is a ARCH_MULTI_V5 platform, which looks like
> > it doesn't support SMP?
>
> Should we drop the driver then..?

Why? Because spinlocks are no-ops on SMP=n, and spinlock bugs thus don't
affect the single platform using the driver?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
