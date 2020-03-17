From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Mar 2020 12:42:17 +0000
Subject: Re: [PATCH] dmaengine: ti: k3-udma: Fix an error handling path in 'k3_udma_glue_cfg_rx_flow()'
Message-Id: <20200317124217.GB4650@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200315155015.27303-1-christophe.jaillet@wanadoo.fr>
 <49a35126-3cc6-0cbb-e632-42a237ef353e@ti.com>
 <e1d2d6af-7dc3-6e90-28d3-05d9b293cba9@ti.com>
In-Reply-To: <e1d2d6af-7dc3-6e90-28d3-05d9b293cba9@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, vkoul@kernel.org, dan.j.williams@intel.com, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Mar 17, 2020 at 09:50:52AM +0200, Grygorii Strashko wrote:
> Hi Christophe,
> 
> On 16/03/2020 09:20, Peter Ujfalusi wrote:
> > Hi Christophe,
> > 
> > On 15/03/2020 17.50, Christophe JAILLET wrote:
> > > All but one error handling paths in the 'k3_udma_glue_cfg_rx_flow()'
> > > function 'goto err' and call 'k3_udma_glue_release_rx_flow()'.
> > > 
> > > This not correct because this function has a 'channel->flows_ready--;' at
> > > the end, but 'flows_ready' has not been incremented here, when we branch to
> > > the error handling path.
> > > 
> > > In order to keep a correct value in 'flows_ready', un-roll
> > > 'k3_udma_glue_release_rx_flow()', simplify it, add some labels and branch
> > > at the correct places when an error is detected.
> > 
> > Good catch!
> > 
> > > Doing so, we also NULLify 'flow->udma_rflow' in a path that was lacking it.
> > 
> > Even better catch ;)
> > 
> > > Fixes: d70241913413 ("dmaengine: ti: k3-udma: Add glue layer for non DMAengine user")
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > ---
> > > Not sure that the last point of the description is correct. Maybe, the
> > > 'xudma_rflow_put / return -ENODEV;' should be kept in order not to
> > > override 'flow->udma_rflow'.
> > > ---
> > >   drivers/dma/ti/k3-udma-glue.c | 30 ++++++++++++++++++++----------
> > >   1 file changed, 20 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/dma/ti/k3-udma-glue.c b/drivers/dma/ti/k3-udma-glue.c
> > > index dbccdc7c0ed5..890573eb1625 100644
> > > --- a/drivers/dma/ti/k3-udma-glue.c
> > > +++ b/drivers/dma/ti/k3-udma-glue.c
> > > @@ -578,12 +578,12 @@ static int k3_udma_glue_cfg_rx_flow(struct k3_udma_glue_rx_channel *rx_chn,
> > >   	if (IS_ERR(flow->udma_rflow)) {
> > >   		ret = PTR_ERR(flow->udma_rflow);
> > >   		dev_err(dev, "UDMAX rflow get err %d\n", ret);
> > > -		goto err;
> > > +		goto err_return;
> > 
> > return err; ?
> > 
> > >   	}
> > 
> > Optionally you could have moved the
> > 	rx_chn->flows_ready++;
> > here and
> 
> Thank you for your patch.
> 
> I tend to agree with Peter here - just may be with comment that it will be dec in
> k3_udma_glue_release_rx_flow().
> All clean ups were moved in standalone function intentionally to avoid
> code duplication in err and normal channel release path, and avoid common errors
> when normal path is fixed, but err path missed.

A standalone function to free everything is *always* going to be buggy.
This patch is the classic bug where when you "free everything", you end
up undoing things that haven't been done.

The best way to do error handling is to 1) Free the most recently
allocated resource and 2)  Use label names which say what the goto does.

With multiple labels like "goto err_rflow_put;" the review only needs to
ask, what was the most recent allocation?   In the case, it was
"udma_rflow" and the "goto err_rflow_put" puts it.  That's very simple
and correct.  There is no need to scroll to the bottom of the function.

When it comes to line count, if we only free successfully allocated
resources then it means we can remove all the if statements from the
k3_udma_glue_release_rx_flow() so the line count ends up being similar
either way.

The other problem with "common cleanup functions" is that when people
want to audit it, instead of looking at the gotos, reviewers have to
open up two terminal windows and go through it line by line.  Currently
static analysis tools are not able to parse common clean functions.

Christophe's patch doesn't just fix the bug he observed, it also fixed
at least one other double free bug.  It's quite hard to spot the second
bug, but Christophe fixed it automatically by following the rules.

regards,
dan carpenter
