From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 12 Feb 2013 12:35:00 +0000
Subject: Re: [patch] mmc: check correct variable after kzalloc()
Message-Id: <20130212123500.GP4937@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130212122454.GC19045@elgon.mountain>
 <87pq05ogy9.fsf@octavius.laptop.org>
In-Reply-To: <87pq05ogy9.fsf@octavius.laptop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Ball <cjb@laptop.org>
Cc: Seungwon Jeon <tgih.jun@samsung.com>, Namjae Jeon <linkinjeon@gmail.com>, Konstantin Dorfman <kdorfman@codeaurora.org>, Venkatraman S <svenkatr@ti.com>, linux-mmc@vger.kernel.org, kbuild@01.org, kernel-janitors@vger.kernel.org

On Tue, Feb 12, 2013 at 07:27:26AM -0500, Chris Ball wrote:
> Hi Dan,
> 
> On Tue, Feb 12 2013, Dan Carpenter wrote:
> > There is a typo here so we check "mqrq_cur->packed" instead of
> > "mqrq_prev->packed".
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> >
> > diff --git a/drivers/mmc/card/queue.c b/drivers/mmc/card/queue.c
> > index c0d1315..97a848b 100644
> > --- a/drivers/mmc/card/queue.c
> > +++ b/drivers/mmc/card/queue.c
> > @@ -378,7 +378,7 @@ int mmc_packed_init(struct mmc_queue *mq, struct mmc_card *card)
> >  	}
> >  
> >  	mqrq_prev->packed = kzalloc(sizeof(struct mmc_packed), GFP_KERNEL);
> > -	if (!mqrq_cur->packed) {
> > +	if (!mqrq_prev->packed) {
> >  		pr_warn("%s: unable to allocate packed cmd for mqrq_prev\n",
> >  			   mmc_card_name(card));
> >  		kfree(mqrq_cur->packed);
> >
> 
> Thanks, this is already fixed via a rebase edit to to the original patch
> in mmc-next.  (Fengguang's 0-day bot caught it.)
> 

Ah, grand.  We try to avoid duplicates but there is a gap in our
system...

regards,
dan carpenter
