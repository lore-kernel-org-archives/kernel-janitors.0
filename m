From: Vinod Koul <vinod.koul@intel.com>
Date: Sun, 25 Aug 2013 11:06:25 +0000
Subject: Re: [patch] dmaengine: ste_dma40: off by one in d40_of_probe()
Message-Id: <20130825105425.GA2748@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130823092343.GF31293@elgon.mountain>
In-Reply-To: <20130823092343.GF31293@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Fri, Aug 23, 2013 at 12:23:43PM +0300, Dan Carpenter wrote:
> If "num_disabled" is equal to STEDMA40_MAX_PHYS (32) then we would write
> one space beyond the end of the pdata->disable_channels[] array.
Applied, thanks

~Vinod
