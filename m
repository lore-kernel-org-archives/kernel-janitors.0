From: Vinod Koul <vkoul@kernel.org>
Date: Wed, 19 Feb 2020 09:39:51 +0000
Subject: Re: [PATCH] dmaengine: coh901318: Fix a double lock bug in dma_tc_handle()
Message-Id: <20200219092751.GH2618@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200217144050.3i4ymbytogod4ijn@kili.mountain>
 <CAMuHMdWaCqZ_zcHuBetAQu4kmoffNw5jvHM5ciTi29MAxL70bg@mail.gmail.com>
 <20200219091754.GE2618@vkoul-mobl>
 <CAMuHMdVC_=V6z+8GubgDvWR37zZdr8f3Fqs-KYUYdZ+e=wYCyg@mail.gmail.com>
In-Reply-To: <CAMuHMdVC_=V6z+8GubgDvWR37zZdr8f3Fqs-KYUYdZ+e=wYCyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Dan Carpenter <dan.carpenter@oracle.com>, kernel-janitors@vger.kernel.org, Jia-Ju Bai <baijiaju1990@gmail.com>, dmaengine <dmaengine@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>

On 19-02-20, 10:20, Geert Uytterhoeven wrote:
> Hi Vinod,
> 
> On Wed, Feb 19, 2020 at 10:18 AM Vinod Koul <vkoul@kernel.org> wrote:
> > On 17-02-20, 23:24, Geert Uytterhoeven wrote:
> > > On Mon, Feb 17, 2020 at 3:41 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > > > The caller is already holding the lock so this will deadlock.
> > > >
> > > > Fixes: 0b58828c923e ("DMAENGINE: COH 901 318 remove irq counting")
> > > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > > ---
> > > > This is the second double lock bug found using static analysis.  The
> > > > previous one was commit 627469e4445b ("dmaengine: coh901318: Fix a
> > > > double-lock bug").
> > > >
> > > > The fact that this has been broken for ten years suggests that no one
> > > > has the hardware.
> > >
> > > Or this only runs CONFIG_SMP=n kernels?
> > > This seems to be used in arch/arm/boot/dts/ste-u300.dts only, and
> > > CONFIG_ARCH_U300 is a ARCH_MULTI_V5 platform, which looks like
> > > it doesn't support SMP?
> >
> > Should we drop the driver then..?
> 
> Why? Because spinlocks are no-ops on SMP=n, and spinlock bugs thus don't
> affect the single platform using the driver?

That doesn't answer the question if anyone has a hardware and we have
users :)

Sorry I should have written better about hardware and testing
rather than cryptic reply which may have suggested about SMP :)

-- 
~Vinod
