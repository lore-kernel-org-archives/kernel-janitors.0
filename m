From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Date: Mon, 06 Feb 2017 14:15:20 +0000
Subject: Re: [patch] tpm: silence an array overflow warning
Message-Id: <20170206141520.nc7v4u2dysv3lsgj@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170203103040.GA5467@mwanda>
	<20170203181120.d3r7ab4twbvelwmi@intel.com>
	<20170206092007.GA11103@mwanda>
In-Reply-To: <20170206092007.GA11103@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tpmdd-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org

On Mon, Feb 06, 2017 at 12:20:07PM +0300, Dan Carpenter wrote:
> On Fri, Feb 03, 2017 at 08:11:20PM +0200, Jarkko Sakkinen wrote:
> > On Fri, Feb 03, 2017 at 01:30:40PM +0300, Dan Carpenter wrote:
> > > We should check that we're within bounds first before checking that
> > > "chip->active_banks[i] != TPM2_ALG_ERROR" so I've re-ordered the two
> > > checks.
> > > 
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > 
> > Thank you, good catch! Do you mind if I squash this.
> > 
> 
> Not at all.
> 
> regards,
> dan carpenter

Already went as a separate commit in a pull request to James :-)

/Jarkko
