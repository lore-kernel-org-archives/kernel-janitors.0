From: Vinod Koul <vkoul@kernel.org>
Date: Tue, 12 Jan 2021 12:42:57 +0000
Subject: Re: [PATCH 1/2] dmaengine: fsldma: Fix a resource leak in the remove function
Message-Id: <20210112123057.GS2771@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201212160516.92515-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201212160516.92515-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: leoyang.li@nxp.com, zw@zh-kernel.org, dan.j.williams@intel.com, timur@freescale.com, linuxppc-dev@lists.ozlabs.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 12-12-20, 17:05, Christophe JAILLET wrote:
> A 'irq_dispose_mapping()' call is missing in the remove function.
> Add it.
> 
> This is needed to undo the 'irq_of_parse_and_map() call from the probe
> function and already part of the error handling path of the probe function.
> 
> It was added in the probe function only in commit d3f620b2c4fe ("fsldma:
> simplify IRQ probing and handling")

Applied both, thanks

-- 
~Vinod
