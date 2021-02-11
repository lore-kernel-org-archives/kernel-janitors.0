From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 11 Feb 2021 10:41:48 +0000
Subject: Re: [PATCH][next] media: i2c: imx334: Fix a read of the uninitialized variable ret
Message-Id: <20210211104148.GE2696@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210210190752.146631-1-colin.king@canonical.com>
 <20210210210303.GE3@paasikivi.fi.intel.com>
In-Reply-To: <20210210210303.GE3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Colin King <colin.king@canonical.com>, "Paul J . Murphy" <paul.j.murphy@intel.com>, Daniele Alessandrelli <daniele.alessandrelli@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Martina Krasteva <martinax.krasteva@intel.com>, Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Feb 10, 2021 at 11:03:03PM +0200, Sakari Ailus wrote:
> Hi Colin,
> 
> On Wed, Feb 10, 2021 at 07:07:52PM +0000, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Currently there is a dev_err error message that is printing the
> > error status in variable ret (that has not been set) instead of
> > the correct error status from imx334->reset_gpio.  Fix this.
> > 
> > Addresses-Coverity: ("Uninitialized scalar variable")
> > Fixes: 9746b11715c3 ("media: i2c: Add imx334 camera sensor driver")
> > 
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/media/i2c/imx334.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> > index 07e31bc2ef18..f8b1caf26c9b 100644
> > --- a/drivers/media/i2c/imx334.c
> > +++ b/drivers/media/i2c/imx334.c
> > @@ -790,7 +790,8 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
> >  	imx334->reset_gpio = devm_gpiod_get_optional(imx334->dev, "reset",
> >  						     GPIOD_OUT_LOW);
> >  	if (IS_ERR(imx334->reset_gpio)) {
> > -		dev_err(imx334->dev, "failed to get reset gpio %d", ret);
> > +		dev_err(imx334->dev, "failed to get reset gpio %ld",
> > +			IS_ERR_VALUE(imx334->reset_gpio));

IS_ERR_VALUE() isn't right.  It would always print 1 here.  It should
just be PTR_ERR().

IS_ERR_VALUE() is like IS_ERR() but for when you're storing memory
addresses in an unsigned long variable.  get_unmapped_area(), for
example, returns unsigned longs.

regards,
dan carpenter
