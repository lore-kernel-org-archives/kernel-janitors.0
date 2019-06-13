From: Leo Yan <leo.yan@linaro.org>
Date: Thu, 13 Jun 2019 09:56:37 +0000
Subject: Re: [PATCH] coresight: potential uninitialized variable in probe()
Message-Id: <20190613095637.GA5242@leoy-ThinkPad-X240s>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190613065815.GF16334@mwanda>
 <20190613074922.GB21113@leoy-ThinkPad-X240s>
 <20190613081419.GG1893@kadam>
In-Reply-To: <20190613081419.GG1893@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Dan,

On Thu, Jun 13, 2019 at 11:14:19AM +0300, Dan Carpenter wrote:
> On Thu, Jun 13, 2019 at 03:49:22PM +0800, Leo Yan wrote:
> > Hi Dan,
> > 
> > On Wed, Jun 12, 2019 at 11:58:15PM -0700, Dan Carpenter wrote:
> > > The "drvdata->atclk" clock is optional, but if it gets set to an error
> > > pointer then we're accidentally return an uninitialized variable instead
> > > of success.
> > 
> > You are right, thanks a lot for pointing out.
> > 
> > I'd like to initialize 'ret = 0' at the head of function, so we can
> > has the same fashion with other CoreSight drivers (e.g. replicator).
> > 
> >  static int funnel_probe(struct device *dev, struct resource *res)
> >  {
> > -	int ret;
> > +	int ret = 0;
> > 
> > If you agree, could you send a new patch for this?
> 
> Obviously that's an option I considered...  The reason I didn't go with
> that is that a common bug that I see is:
> 
> 	int ret = 0;
> 
> 	p = kmalloc();
> 	if (!p)
> 		goto free_whatever;
> 
> In my experience it's better to initialize the return as late as
> possible so that you get static checker warnings when you forget to set
> the error code.

Just want to check one thing, which static checker you are using?
I use sparse but it doesn't report this issue (I learned coccinelle
also can do this but it outputs verbose logs).

To be honest, I didn't often run static checker when committed patches,
but hope later can improve for this.

> Also I think my way is more readable.  I like to make the success path
> as explicit as possible.  I hate when people do things like:
> 
> 	if (!ret)
> 		return ret;
> 
> About 10% of the time when you see this it is a bug, but it's hard to
> tell because it's not readable like it would be if people did:
> 
> 	if (!ret)
> 		return 0;
> 
> Or sometimes you see things like:
> 
> 	if (corner_case)
> 		goto free; /* success path */
> 
> Without the "/* success path */ comment explaining why we're returning
> zero most readers will assume it's a mistake.

Thanks for sharing much knowledge; your change is okay for me.

I think the point is the good habit can avoid pitfall and traps :) [1]

Thanks,
Leo Yan

[1] https://www.amazon.com/C-Traps-Pitfalls-Andrew-Koenig/dp/0201179288
