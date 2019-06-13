From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Jun 2019 08:14:19 +0000
Subject: Re: [PATCH] coresight: potential uninitialized variable in probe()
Message-Id: <20190613081419.GG1893@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190613065815.GF16334@mwanda>
 <20190613074922.GB21113@leoy-ThinkPad-X240s>
In-Reply-To: <20190613074922.GB21113@leoy-ThinkPad-X240s>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leo Yan <leo.yan@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Thu, Jun 13, 2019 at 03:49:22PM +0800, Leo Yan wrote:
> Hi Dan,
> 
> On Wed, Jun 12, 2019 at 11:58:15PM -0700, Dan Carpenter wrote:
> > The "drvdata->atclk" clock is optional, but if it gets set to an error
> > pointer then we're accidentally return an uninitialized variable instead
> > of success.
> 
> You are right, thanks a lot for pointing out.
> 
> I'd like to initialize 'ret = 0' at the head of function, so we can
> has the same fashion with other CoreSight drivers (e.g. replicator).
> 
>  static int funnel_probe(struct device *dev, struct resource *res)
>  {
> -	int ret;
> +	int ret = 0;
> 
> If you agree, could you send a new patch for this?

Obviously that's an option I considered...  The reason I didn't go with
that is that a common bug that I see is:

	int ret = 0;

	p = kmalloc();
	if (!p)
		goto free_whatever;

In my experience it's better to initialize the return as late as
possible so that you get static checker warnings when you forget to set
the error code.

Also I think my way is more readable.  I like to make the success path
as explicit as possible.  I hate when people do things like:

	if (!ret)
		return ret;

About 10% of the time when you see this it is a bug, but it's hard to
tell because it's not readable like it would be if people did:

	if (!ret)
		return 0;

Or sometimes you see things like:

	if (corner_case)
		goto free; /* success path */

Without the "/* success path */ comment explaining why we're returning
zero most readers will assume it's a mistake.

regards,
dan carpenter
