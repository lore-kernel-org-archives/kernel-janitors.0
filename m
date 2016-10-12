From: Russell King - ARM Linux <linux@armlinux.org.uk>
Date: Wed, 12 Oct 2016 08:52:39 +0000
Subject: Re: [patch] serial: stm32: fix a type issue
Message-Id: <20161012085239.GD1041@n2100.armlinux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161012062103.GS12841@mwanda>
In-Reply-To: <20161012062103.GS12841@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Wed, Oct 12, 2016 at 09:21:03AM +0300, Dan Carpenter wrote:
> We store UNDEF_REG in a u8.  It causes a problem in functions like
> stm32_tx_dma_complete() where we check "if (ofs->icr = UNDEF_REG)".
> 
> Fixes: 3489187204eb ('serial: stm32: adding dma support')

Correct form is:

Fixes: 12-digit-hash ("summary line")

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
