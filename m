From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 30 Nov 2016 19:26:21 +0000
Subject: Re: [bug report] Add support of Cavium Liquidio ethernet adapters
Message-Id: <20161130192621.GL28558@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161130185754.GA8645@mwanda>
In-Reply-To: <20161130185754.GA8645@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Nov 30, 2016 at 07:02:09PM +0000, Vatsavayi, Raghu wrote:
> >   1005                       oq_no++) {
> >   1006                          if (!(oct->droq_intr & BIT_ULL(oq_no)))
> >   1007                                  continue;
> >   1008
> >   1009                          droq = oct->droq[oq_no];
> >   1010
> >   1011                          if (droq->ops.poll_mode) {
> >   1012                                  droq->ops.napi_fn(droq);
> >   1013                                  oct_priv->napi_mask |= (1 << oq_no);
> > 
> > It should be 1ULL << oq_no.  But the other bug is tahte ->napi_mask is a long
> > but that will break on 32 bit systems when
> > MAX_OCTEON_OUTPUT_QUEUES() is 64.  Is that a possible combination?
> > 
> 
> [Raghu]: These drivers are for 64 bit systems as mentioned in Kconfig.
> 

Ah...  Grand.  I see that now.  Can you send a patch for the others?

regards,
dan carpenter

