From: Vinod Koul <vinod.koul@intel.com>
Date: Wed, 16 Apr 2014 06:42:36 +0000
Subject: Re: [patch] dmaengine: sirf: off by one in of_dma_sirfsoc_xlate()
Message-Id: <20140416063036.GJ32284@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140403072933.GD14286@mwanda>
In-Reply-To: <20140403072933.GD14286@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Apr 03, 2014 at 10:29:33AM +0300, Dan Carpenter wrote:
> The ">" here should be ">=" or we are one step beyond the end of the
> sdma->channels[] array.
> 
> Fixes: 2e041c94628c ('dmaengine: sirf: enable generic dt binding for dma channels')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks

-- 
~Vinod
