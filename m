From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 11 Dec 2017 11:33:45 +0000
Subject: Re: [PATCH] ASoC: Intel: Skylake: Re-order some code to silence a warning
Message-Id: <20171211113345.ubl7rj7ftt62ox5s@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171208115425.rqclgmhcph5gn47j@mwanda>
 <1512991223.25007.590.camel@linux.intel.com>
In-Reply-To: <1512991223.25007.590.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Jani Nikula <jani.nikula@intel.com>, Sriram Periyasamy <sriramx.periyasamy@intel.com>, Guneshwor Singh <guneshwor.o.singh@intel.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vinod.koul@intel.com>, kernel-janitors@vger.kernel.org, Mark Brown <broonie@kernel.org>, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, Senthilnathan Veppur <senthilnathanx.veppur@intel.com>, "Subhransu S. Prusty" <subhransu.s.prusty@intel.com>

On Mon, Dec 11, 2017 at 01:20:23PM +0200, Andy Shevchenko wrote:
> On Fri, 2017-12-08 at 14:54 +0300, Dan Carpenter wrote:
> > I get a Smatch warning here:
> > 
> >     sound/soc/intel/skylake/skl-nhlt.c:335 skl_get_ssp_clks()
> >     error: testing array offset 'j' after use.
> > 
> > The code is harmless, but the checker is right that we should swap
> > these
> > two conditions so we verify that the offset is within bounds before we
> > use it.
> 
> > -		for (j = 0; (sclk[id].rate_cfg[j].rate != 0) &&
> > -				(j < SKL_MAX_CLK_RATES); j++) {
> > +		for (j = 0; (j < SKL_MAX_CLK_RATES) &&
> > +			    (sclk[id].rate_cfg[j].rate != 0); j++) {
> >  			if (sclk[id].rate_cfg[j].rate = rate) {
> >  				present = true;
> >  				break;
> 
> I would rather remove also redundant parens and move the condition into
> the loop.

I didn't like the way the code was written either but it's impossible
to know how much change people are going to accept.  Even though I think
that extra parenthesis shouldn't have been there, the original author
felt they helped, so I try to be accomodating...

Anyway, I can resend.

regards,
dan carpenter

