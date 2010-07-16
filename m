From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 16 Jul 2010 07:18:44 +0000
Subject: Re: [PATCH 2/8] touchscreen: fix sign bug
Message-Id: <20100716071844.GD3712@core.coreip.homeip.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1279219435-12128-1-git-send-email-segooon@gmail.com>
 <20100715204927.GA4627@pengutronix.de>
In-Reply-To: <20100715204927.GA4627@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>, kernel-janitors@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Luotao Fu <l.fu@pengutronix.de>, linux-input@vger.kernel.org, linux-kernel

On Thu, Jul 15, 2010 at 10:49:27PM +0200, Luotao Fu wrote:
> On Thu, Jul 15, 2010 at 10:43:54PM +0400, Kulikov Vasiliy wrote:
> > platform_get_irq_byname() can return negative results, it is not seen to
> > unsigned ts_irq. Make it signed.
> > 
> > Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> 
> Acked-By: Luotao Fu <l.fu@pengutronix.de>
> 

OK, the driver is still in Samuel's tree so he gets to pick the patch...

Thanks.

-- 
Dmitry
