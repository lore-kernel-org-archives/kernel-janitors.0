From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Date: Mon, 22 Dec 2008 16:33:09 +0000
Subject: Re: [PATCH 1/2] arch/arm/plat-mxc: Add local_irq_restore in error handling code
Message-Id: <20081222163309.GA16392@n2100.arm.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812212153570.3635@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0812212153570.3635@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: kernel@pengutronix.de, linux-arm-kernel@lists.arm.linux.org.uk, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Dec 21, 2008 at 09:54:23PM +0100, Julia Lawall wrote:
> There is a call to local_irq_restore in the normal exit case, so it would
> seem that there should be one on an error return as well.

Please check what's queued up for the next merge; a similar change is
already merged as part of a larger patch.  (which is more correct
since it calls local_irq_restore before the printk.)
