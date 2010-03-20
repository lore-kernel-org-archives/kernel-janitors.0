From: Russell King <rmk+lkml@arm.linux.org.uk>
Date: Sat, 20 Mar 2010 14:57:30 +0000
Subject: Re: [PATCH 01/24] mtd/maps/pismo: remove dangling pointer and a
Message-Id: <20100320145729.GA5399@flint.arm.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1269094385-16114-1-git-send-email-w.sang@pengutronix.de> <1269094385-16114-2-git-send-email-w.sang@pengutronix.de>
In-Reply-To: <1269094385-16114-2-git-send-email-w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Woodhouse <David.Woodhouse-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org

On Sat, Mar 20, 2010 at 03:12:42PM +0100, Wolfram Sang wrote:
> + exit_free:
> +	i2c_set_clientdata(client, NULL);
> +	kfree(prismo);

And this is a compile error...

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
