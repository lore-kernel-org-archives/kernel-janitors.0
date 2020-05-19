From: Vinod Koul <vkoul@kernel.org>
Date: Tue, 19 May 2020 16:56:39 +0000
Subject: Re: [PATCH] dmaengine: tegra210-adma: Fix an error handling path in 'tegra_adma_probe()'
Message-Id: <20200519165632.GQ374218@vkoul-mobl.Dlink>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200516214205.276266-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200516214205.276266-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: ldewangan@nvidia.com, jonathanh@nvidia.com, dan.j.williams@intel.com, thierry.reding@gmail.com, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 16-05-20, 23:42, Christophe JAILLET wrote:
> Commit b53611fb1ce9 ("dmaengine: tegra210-adma: Fix crash during probe")
> has moved some code in the probe function and reordered the error handling
> path accordingly.
> However, a goto has been missed.
> 
> Fix it and goto the right label if 'dma_async_device_register()' fails, so
> that all resources are released.

Applied for fixes, thanks

-- 
~Vinod
