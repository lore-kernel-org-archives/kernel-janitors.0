From: Vinod Koul <vkoul@kernel.org>
Date: Mon, 21 Dec 2020 16:34:52 +0000
Subject: Re: [PATCH] dmaengine: dw-edma: Fix use after free in dw_edma_alloc_chunk()
Message-Id: <20201221162252.GH3323@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9dTBFrUPEvvW7qc@mwanda>
In-Reply-To: <X9dTBFrUPEvvW7qc@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org

On 14-12-20, 14:56, Dan Carpenter wrote:
> If the dw_edma_alloc_burst() function fails then we free "chunk" but
> it's still on the "desc->chunk->list" list so it will lead to a use
> after free.  Also the "->chunks_alloc" count is incremented when it
> shouldn't be.
> 
> In current kernels small allocations are guaranteed to succeed and
> dw_edma_alloc_burst() can't fail so this will not actually affect
> runtime.

Applied, thanks

-- 
~Vinod
