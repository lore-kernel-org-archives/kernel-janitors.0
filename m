From: Vinod Koul <vkoul@kernel.org>
Date: Tue, 26 Jan 2021 17:44:05 +0000
Subject: Re: [PATCH] dmaengine: ti: k3-udma: Fix a resource leak in an error handling path
Message-Id: <20210126173205.GZ2771@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210124070923.724479-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20210124070923.724479-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: peter.ujfalusi@gmail.com, dan.j.williams@intel.com, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 24-01-21, 08:09, Christophe JAILLET wrote:
> In 'dma_pool_create()', we return -ENOMEM, but don't release the resources
> already allocated, as in all the other error handling paths.
> 
> Go to 'err_res_free' instead of returning directly.

Applied, thanks

-- 
~Vinod
