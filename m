From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 08 Aug 2014 04:58:33 +0000
Subject: Re: [PATCH 3/4] block: fix error return code
Message-Id: <alpine.DEB.2.02.1408080658040.2045@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407445067-4044-1-git-send-email-Julia.Lawall@lip6.fr> <1407445067-4044-4-git-send-email-Julia.Lawall@lip6.fr> <x49sil89djr.fsf@segfault.boston.devel.redhat.com>
In-Reply-To: <x49sil89djr.fsf@segfault.boston.devel.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Moyer <jmoyer@redhat.com>
Cc: Joshua Morris <josh.h.morris@us.ibm.com>, kernel-janitors@vger.kernel.org, Philip Kelleher <pjk1939@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org



On Thu, 7 Aug 2014, Jeff Moyer wrote:

> Julia Lawall <Julia.Lawall@lip6.fr> writes:
> 
> > diff --git a/drivers/block/rsxx/core.c b/drivers/block/rsxx/core.c
> > index a8de2ee..fa8077a 100644
> > --- a/drivers/block/rsxx/core.c
> > +++ b/drivers/block/rsxx/core.c
> > @@ -942,6 +942,7 @@ static int rsxx_pci_probe(struct pci_dev *dev,
> >  	card->event_wq = create_singlethread_workqueue(DRIVER_NAME"_event");
> >  	if (!card->event_wq) {
> >  		dev_err(CARD_TO_DEV(card), "Failed card event setup.\n");
> > +		st = -ENOMEM;
> >  		goto failed_event_handler;
> >  	}
> 
> Reviewed-by: Jeff Moyer <jmoyer@redhat.com>
> 
> BTW, just above this there is questionable code:
> 
>         st = rsxx_get_num_targets(card, &card->n_targets);
>         if (st)
>                 dev_info(CARD_TO_DEV(card),
>                         "Failed reading the number of DMA targets\n");
> 
>         card->ctrl = kzalloc(card->n_targets * sizeof(*card->ctrl), GFP_KERNEL);
>         if (!card->ctrl) {
>                 st = -ENOMEM;
>                 goto failed_dma_setup;
>         }
> 
> From my reading of the kzalloc code, ZERO_SIZE_PTR (which is 16 cast to
> a void *) would be returned from that kzalloc call if the
> rsxx_get_num_targets call failed (since you'd be kzalloc-ing 0 bytes).
> That would lead to the !card->ctrl check not working, right?
> 
> I'd suggest not continuing after rsxx_get_num_targets fails.

Good point.  I'll fix it up.

julia
