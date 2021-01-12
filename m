From: Vinod Koul <vkoul@kernel.org>
Date: Tue, 12 Jan 2021 12:43:27 +0000
Subject: Re: [PATCH] dmaengine: owl-dma: Fix a resource leak in the remove function
Message-Id: <20210112123127.GT2771@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201212162535.95727-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201212162535.95727-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: dan.j.williams@intel.com, afaerber@suse.de, manivannan.sadhasivam@linaro.org, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 12-12-20, 17:25, Christophe JAILLET wrote:
> A 'dma_pool_destroy()' call is missing in the remove function.
> Add it.
> 
> This call is already made in the error handling path of the probe function.

Applied, thanks

-- 
~Vinod
