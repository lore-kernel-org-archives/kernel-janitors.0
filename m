From: Evgeniy Polyakov <zbr@ioremap.net>
Date: Thu, 13 Dec 2012 18:27:22 +0000
Subject: Re: [PATCH 1/2] drivers/w1/masters/mxc_w1.c: use devm_ functions
Message-Id: <20121213182722.GA30828@ioremap.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1354835724-26945-2-git-send-email-Julia.Lawall@lip6.fr>
 <20121211212555.GA15333@ioremap.net>
 <20121213093938.GX6568@mwanda>
In-Reply-To: <20121213093938.GX6568@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Dec 13, 2012 at 12:39:38PM +0300, Dan Carpenter (dan.carpenter@oracle.com) wrote:
> On Wed, Dec 12, 2012 at 01:25:56AM +0400, Evgeniy Polyakov wrote:
> > I suppose mdev will be automatically freed, but who will release
> > mdev->clk and other private members of mdev structure?
> 
> +   mdev->clk = devm_clk_get(&pdev->dev, NULL);
> 
> ->clk is now a devm pointer as well.

Argh, I see it. Thanks for clarification.

-- 
	Evgeniy Polyakov
