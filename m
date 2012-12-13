From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Dec 2012 11:20:29 +0000
Subject: Re: [PATCH 1/2] drivers/w1/masters/mxc_w1.c: use devm_ functions
Message-Id: <20121213112029.GY6568@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1354835724-26945-2-git-send-email-Julia.Lawall@lip6.fr>
 <20121211212555.GA15333@ioremap.net>
 <20121213093938.GX6568@mwanda>
 <alpine.DEB.2.02.1212131118220.1966@hadrien>
In-Reply-To: <alpine.DEB.2.02.1212131118220.1966@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Evgeniy Polyakov <zbr@ioremap.net>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Dec 13, 2012 at 11:18:53AM +0100, Julia Lawall wrote:
> On Thu, 13 Dec 2012, Dan Carpenter wrote:
> 
> > On Wed, Dec 12, 2012 at 01:25:56AM +0400, Evgeniy Polyakov wrote:
> > > I suppose mdev will be automatically freed, but who will release
> > > mdev->clk and other private members of mdev structure?
> >
> > +   mdev->clk = devm_clk_get(&pdev->dev, NULL);
> >
> > ->clk is now a devm pointer as well.
> 
> Thanks for the suggestion.  I will submit a patch shortly.
> 

Huh?  I think there is a miscommunication here.  I was trying to
explain that your original patch handles releasing ->clk.

I've reviewed the patch again and I still don't see a problem with
it.  What will you change when you resubmit?

regards,
dan carpenter

