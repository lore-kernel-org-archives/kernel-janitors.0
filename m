From: Vinod Koul <vinod.koul@intel.com>
Date: Thu, 12 Oct 2017 14:17:05 +0000
Subject: Re: [PATCH][dma-next] dmaengine: stm32: remove redundant initialization of hwdesc
Message-Id: <20171012140505.GP30097@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171011102822.19166-1-colin.king@canonical.com>
In-Reply-To: <20171011102822.19166-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Wed, Oct 11, 2017 at 11:28:22AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> hwdesc is being initialized to desc->hwdesc but this is never read
> as hwdesc is overwritten in a for-loop.  Remove the redundant
> initialization and move the declaration of hwdesc into the for-loop.
> 
> Cleans up clang warning:
> Value stored to 'hwdesc' during its initialization is never read

Applied, thanks

-- 
~Vinod
