From: Russell King <rmk+lkml@arm.linux.org.uk>
Date: Sat, 20 Mar 2010 15:41:13 +0000
Subject: Re: [PATCH 01/24] mtd/maps/pismo: remove dangling pointer and a
Message-Id: <20100320154113.GB14470@flint.arm.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1269094385-16114-1-git-send-email-w.sang@pengutronix.de> <1269094385-16114-2-git-send-email-w.sang@pengutronix.de> <20100320145729.GA5399@flint.arm.linux.org.uk> <20100320153146.GB5515@pengutronix.de>
In-Reply-To: <20100320153146.GB5515-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: David Woodhouse <David.Woodhouse-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Sat, Mar 20, 2010 at 04:31:46PM +0100, Wolfram Sang wrote:
> Subject: [PATCH V2] mtd/maps/pismo: remove dangling pointer and a leak
> 
> While looking for drivers which forgot to clear i2c_clientdata before freeing
> the data structure it points to, I found that the pismo driver even has a leak
> on the probe error path.
> 
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> Cc: Russell King <rmk+kernel@arm.linux.org.uk>

Thanks.

Acked-by: Russell King <rmk+kernel@arm.linux.org.uk>

David, are you going to pick this up?

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
