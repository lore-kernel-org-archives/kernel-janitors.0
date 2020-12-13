From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 13 Dec 2020 22:22:35 +0000
Subject: Re: [PATCH] mtd: remove redundant assignment to pointer eb
Message-Id: <CAFLxGvy9LzJmNshqkxoC_kuVLJztgBDhfYPjkBUWtwd1-9UY-Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200911102321.22515-1-colin.king@canonical.com>
 <20200911175514.766eeaf1@xps13>
In-Reply-To: <20200911175514.766eeaf1@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org, Colin King <colin.king@canonical.com>

On Fri, Sep 11, 2020 at 5:59 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> Hi Colin,
>
> Colin King <colin.king@canonical.com> wrote on Fri, 11 Sep 2020
> 11:23:21 +0100:
>
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > Pointer eb is being assigned a value that is never read, the assignment
> > is redundant and can be removed.
> >
> > Addresses-Coverity: ("Unused value")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/mtd/mtdswap.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
> > index 58eefa43af14..795dec4483c2 100644
> > --- a/drivers/mtd/mtdswap.c
> > +++ b/drivers/mtd/mtdswap.c
> > @@ -1053,7 +1053,6 @@ static int mtdswap_writesect(struct mtd_blktrans_dev *dev,
> >       if (ret < 0)
> >               return ret;
> >
> > -     eb = d->eb_data + (newblock / d->pages_per_eblk);
> >       d->page_data[page] = newblock;
> >
> >       return 0;
>
> Yes it looks unused but perhaps it helps to catch the logic here. This
> is not a strong disagreement but I'd keep it this way. Let's see what
> other maintainers think.

This looks like dead code, let's rip it out.

-- 
Thanks,
//richard
