From: Vinod Koul <vinod.koul@intel.com>
Date: Tue, 03 May 2016 06:50:00 +0000
Subject: Re: [PATCH 0/5] Use dma_pool_zalloc
Message-Id: <20160503065533.GO2274@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1461960552-7429-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1461960552-7429-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Fri, Apr 29, 2016 at 10:09:07PM +0200, Julia Lawall wrote:
> Dma_pool_zalloc combines dma_pool_alloc and memset 0.  The semantic patch
> that makes this transformation is as follows: (http://coccinelle.lip6.fr/)

Applied all dmaengine patches

-- 
~Vinod
