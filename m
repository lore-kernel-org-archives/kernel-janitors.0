From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Sun, 21 Dec 2008 22:27:58 +0000
Subject: Re: [PATCH 1/2] arch/arm/plat-mxc: Add local_irq_restore in error
Message-Id: <20081221222758.GB1614@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812212153570.3635@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812212153570.3635@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: kernel@pengutronix.de, linux-arm-kernel@lists.arm.linux.org.uk, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

On Sun, Dec 21, 2008 at 09:54:23PM +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> There is a call to local_irq_restore in the normal exit case, so it would
> seem that there should be one on an error return as well.

Yes, that's correct. Thanks for the patch. A fix for this is already
scheduled upstream though.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
