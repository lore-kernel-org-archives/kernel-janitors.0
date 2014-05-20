From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 20 May 2014 09:15:26 +0000
Subject: Re: [PATCH 1/2] mtd: delete unneeded call to platform_get_drvdata
Message-Id: <20140520091526.GF15585@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400308369-24375-1-git-send-email-Julia.Lawall@lip6.fr>
 <CAOMZO5AymcCnC6Awt2LiGP9yz=baRA0HLoLRUSBgNeg3b5=9xQ@mail.gmail.com>
 <alpine.DEB.2.10.1405171511140.2587@hadrien>
 <20140520083531.GH2413@norris-Latitude-E6410>
In-Reply-To: <20140520083531.GH2413@norris-Latitude-E6410>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Norris <computersforpeace@gmail.com>
Cc: Mike Frysinger <vapier.adi@gmail.com>, David Woodhouse <dwmw2@infradead.org>, kernel-janitors@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Fabio Estevam <festevam@gmail.com>

On Tue, May 20, 2014 at 01:35:31AM -0700, Brian Norris wrote:
> > > >  static int bf5xx_nand_resume(struct platform_device *dev)
> > > >  {
> > > > -       struct bf5xx_nand_info *info = platform_get_drvdata(dev);
> > > > -
> > > >         return 0;
> > >
> > > In this case bf5xx_nand_suspend/resume could be removed?
> > 
> > I don't know.  It looks like it is intentional to have a definition that
> > returns an indication of success?  The complete set of definitions is:
> 
> I'm not so sure. I believe suspend/resume works just fine without the
> hooks, if those hooks would otherwise be doing nothing. It is notable
> that this driver is not using the modern dev_pm_ops form of the
> suspend/resume callbacks, so maybe it just hasn't aged gracefully--and
> possibly was never supported properly in the first place.
> 

These are called from platform_legacy_suspend/platform_legacy_resume.
It looks like the functions are not needed.

(I am not an expert on pm, I just querried my Smatch Cross Function
Database which is awesome).

regards,
dan carpenter

