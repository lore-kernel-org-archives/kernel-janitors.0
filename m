From: Vinod Koul <vinod.koul@intel.com>
Date: Mon, 16 Nov 2015 03:50:29 +0000
Subject: Re: [patch] dmaengine: edma: predecence bug in GET_NUM_QDMACH()
Message-Id: <20151116033828.GW25173@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151104133831.GH20966@mwanda>
In-Reply-To: <20151104133831.GH20966@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Nov 04, 2015 at 04:38:31PM +0300, Dan Carpenter wrote:
> The current code uses bits 0-2 instead of 4-6 as the comment says.
> 

Applied, thanks

-- 
~Vinod
