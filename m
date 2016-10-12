From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Oct 2016 09:11:11 +0000
Subject: Re: [patch] serial: stm32: fix a type issue
Message-Id: <20161012091111.GC5687@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161012062103.GS12841@mwanda>
 <20161012085239.GD1041@n2100.armlinux.org.uk>
In-Reply-To: <20161012085239.GD1041@n2100.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Wed, Oct 12, 2016 at 09:52:39AM +0100, Russell King - ARM Linux wrote:
> On Wed, Oct 12, 2016 at 09:21:03AM +0300, Dan Carpenter wrote:
> > We store UNDEF_REG in a u8.  It causes a problem in functions like
> > stm32_tx_dma_complete() where we check "if (ofs->icr = UNDEF_REG)".
> > 
> > Fixes: 3489187204eb ('serial: stm32: adding dma support')
> 
> Correct form is:
> 
> Fixes: 12-digit-hash ("summary line")

When I originally created the Fixes tag format, I used single quotes.
I don't remember why though and I can change with the times.  :)

regards,
dan carpenter

