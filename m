From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Sep 2015 18:14:15 +0000
Subject: Re: iomap: implement pcim_iounmap_regions()
Message-Id: <20150916181415.GK5004@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150916160024.GB9735@mwanda>
In-Reply-To: <20150916160024.GB9735@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Sep 16, 2015 at 01:10:00PM -0400, Tejun Heo wrote:
> Hello,
> 
> On Wed, Sep 16, 2015 at 07:00:24PM +0300, Dan Carpenter wrote:
> >    421          for (i = 0; i < DEVICE_COUNT_RESOURCE; i++) {
> >    422                  if (!(mask & (1 << i)))
> >    423                          continue;
> > 
> > Probably maks is always valid is what helps us but basically the static
> > checker is suggesting that instead of DEVICE_COUNT_RESOURCE we should
> > be using PCI_ROM_RESOURCE or PCIM_IOMAP_MAX.  It could be that this was
> > deliberate though...
> 
> Looks like a silly mistake on my part.  Care to submit a patch?
> 

Sure, I will do that.

regards,
dan carpenter

