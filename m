From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 24 Jan 2021 20:14:32 +0000
Subject: Re: [PATCH] mtd: rawnand: Fix an error handling path in 'ebu_dma_start()'
Message-Id: <CAFLxGvzFDPBGY1uoB7vqJreOSfs9N2PGMDTbQ24PYBWBRVR4oQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210124073955.728797-1-christophe.jaillet@wanadoo.fr>
 <fe72d1d2-8222-5cda-74ff-9327725f196a@web.de>
In-Reply-To: <fe72d1d2-8222-5cda-74ff-9327725f196a@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>

On Sun, Jan 24, 2021 at 9:13 PM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> > If 'dmaengine_prep_slave_single()' fails, we must undo a previous
> > 'dma_map_single()' call, as already done in all the other error handling
> > paths of this function.
>
> Would you ever like to use an imperative wording for the change description?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=fdbc80bdc4365078a0f7d65631171cb80e3ffd6e#n89
>
>
> …
> > +++ b/drivers/mtd/nand/raw/intel-nand-controller.c
> > @@ -318,8 +318,10 @@ static int ebu_dma_start(struct ebu_nand_controller *ebu_host, u32 dir,
> >       }
> >
> >       tx = dmaengine_prep_slave_single(chan, buf_dma, len, dir, flags);
> > -     if (!tx)
> > -             return -ENXIO;
> > +     if (!tx) {
> > +             ret = -ENXIO;
> > +             goto err_unmap;
> > +     }
> >
> >       tx->callback = callback;
> …
>
> By the way:
> Can it be nicer to achieve the statement “ret = -EIO;” by a jump for
> a target like “e_io” so that less exception handling code would be duplicated
> for this function implementation?

Please feel free to ignore Markus.

https://lore.kernel.org/lkml/X+x3pIanr18Ep4ga@kroah.com/

-- 
Thanks,
//richard
