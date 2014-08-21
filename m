From: Julia Lawall <julia.lawall@lip6.fr>
Date: Thu, 21 Aug 2014 10:18:21 +0000
Subject: Re: [PATCH 1/4] mfd: menelaus: fix error return code
Message-Id: <alpine.DEB.2.10.1408210517570.2534@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1407355938-10932-2-git-send-email-Julia.Lawall@lip6.fr> <20140821082605.GS4266@lee--X1>
In-Reply-To: <20140821082605.GS4266@lee--X1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On Thu, 21 Aug 2014, Lee Jones wrote:

> On Wed, 06 Aug 2014, Julia Lawall wrote:
>
> > From: Julia Lawall <Julia.Lawall@lip6.fr>
> >
> > Convert a zero return value on error to a negative one, as returned
> > elsewhere in the function.
> >
> > A simplified version of the semantic match that finds this problem is as
> > follows: (http://coccinelle.lip6.fr/)
> >
> > // <smpl>
> > (
> > if@p1 (\(ret < 0\|ret != 0\))
> >  { ... return ret; }
> > |
> > ret@p1 = 0
> > )
> > ... when != ret = e1
> >     when != &ret
> > *if(...)
> > {
> >   ... when != ret = e2
> >       when forall
> >  return ret;
> > }
> >
> > // </smpl>
> >
> > Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> >
> > ---
> >  drivers/mfd/menelaus.c |    4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/mfd/menelaus.c b/drivers/mfd/menelaus.c
> > index 5e2667a..16070d8 100644
> > --- a/drivers/mfd/menelaus.c
> > +++ b/drivers/mfd/menelaus.c
> > @@ -1240,8 +1240,10 @@ static int menelaus_probe(struct i2c_client *client,
> >  	pr_info("Menelaus rev %d.%d\n", rev >> 4, rev & 0x0f);
> >
> >  	val = menelaus_read_reg(MENELAUS_VCORE_CTRL1);
> > -	if (val < 0)
> > +	if (val < 0) {
> > +		err = val;
> >  		goto fail;
> > +	}
>
> I'd prefer it if you could s/val/err and remove val altogether.  While
> you're there, if you can s/(1 << 7)/BIT(7), that would be great
> too.  If you don't have time, or just don't want to do it, I will be
> happy to submit a patch instead with your Reported-by.  Your call.
>
> >  	if (val & (1 << 7))
> >  		menelaus->vcore_hw_mode = 1;
> >  	else
> >

I will look into it.  Thanks for the feedback.

julia
