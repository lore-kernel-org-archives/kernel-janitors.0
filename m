From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Dec 2012 09:39:38 +0000
Subject: Re: [PATCH 1/2] drivers/w1/masters/mxc_w1.c: use devm_ functions
Message-Id: <20121213093938.GX6568@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1354835724-26945-2-git-send-email-Julia.Lawall@lip6.fr>
 <20121211212555.GA15333@ioremap.net>
In-Reply-To: <20121211212555.GA15333@ioremap.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeniy Polyakov <zbr@ioremap.net>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Dec 12, 2012 at 01:25:56AM +0400, Evgeniy Polyakov wrote:
> I suppose mdev will be automatically freed, but who will release
> mdev->clk and other private members of mdev structure?

+   mdev->clk = devm_clk_get(&pdev->dev, NULL);

->clk is now a devm pointer as well.

regards,
dan carpenter

