From: Vinod Koul <vkoul@kernel.org>
Date: Tue, 21 May 2019 04:57:21 +0000
Subject: Re: [PATCH] dma: dw-axi-dmac: fix null dereference when pointer first is null
Message-Id: <20190521045713.GQ15118@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190508223329.26796-1-colin.king@canonical.com>
In-Reply-To: <20190508223329.26796-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Dan Williams <dan.j.williams@intel.com>, Huang Shijie <sjhuang@iluvatar.ai>, dmaengine@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 08-05-19, 23:33, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> In the unlikely event that axi_desc_get returns a null desc in the
> very first iteration of the while-loop the error exit path ends
> up calling axi_desc_put on a null pointer 'first' and this causes
> a null pointer dereference.  Fix this by adding a null check on
> pointer 'first' before calling axi_desc_put.

Applied, thanks

-- 
~Vinod
