From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 May 2018 09:51:07 +0000
Subject: Re: [PATCH] PM / OPP: silence an uninitialized variable warning
Message-Id: <20180516095107.7s5w7to5hls7er7x@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180516084900.GC23043@mwanda>
In-Reply-To: <20180516084900.GC23043@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, May 16, 2018 at 03:02:33PM +0530, Viresh Kumar wrote:
> On 16-05-18, 11:49, Dan Carpenter wrote:
> > Smatch complains that "rate" can be uninitialized here.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > diff --git a/drivers/opp/of.c b/drivers/opp/of.c
> > index 7026e9f484ea..afc844806db0 100644
> > --- a/drivers/opp/of.c
> > +++ b/drivers/opp/of.c
> > @@ -317,7 +317,8 @@ static int _opp_add_static_v2(struct opp_table *opp_table, struct device *dev,
> >  
> >  	/* Check if the OPP supports hardware's hierarchy of versions or not */
> >  	if (!_opp_is_supported(dev, opp_table, np)) {
> > -		dev_dbg(dev, "OPP not supported by hardware: %llu\n", rate);
> > +		dev_dbg(dev, "OPP not supported by hardware: %lu\n",
> > +			new_opp->rate);
> >  		goto free_opp;
> >  	}
> 
> Well, I never got that warning nor did the buildbot report me anything
> like that. Not sure how you got that :)
> 
> But AFAICT, there is indeed a path where this can happen and I am not
> sure the proposed solution is the most readable one. I would rather
> initialize rate to 0 while defining it at the top.
> 

Sure.  No problem.  I'll resend.

regards,
dan carpenter

