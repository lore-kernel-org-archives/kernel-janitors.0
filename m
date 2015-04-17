From: Vinod Koul <vinod.koul@intel.com>
Date: Fri, 17 Apr 2015 18:17:23 +0000
Subject: Re: [patch 1/2] dmaengine: xgene: buffer overflow in xgene_dma_init_channels()
Message-Id: <20150417180523.GH30624@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150409090503.GD17605@mwanda>
In-Reply-To: <20150409090503.GD17605@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Apr 09, 2015 at 12:05:04PM +0300, Dan Carpenter wrote:
> We put 9 characters into the 8 character name[] array.  Let's make the
> array bigger and change the sprintf() to snprintf().
> 
Applied, both

Thanks

-- 
~Vinod

