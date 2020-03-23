From: Vinod Koul <vkoul@kernel.org>
Date: Mon, 23 Mar 2020 06:33:27 +0000
Subject: Re: [PATCH V2] dmaengine: ti: k3-udma-glue: Fix an error handling path in 'k3_udma_glue_cfg_rx_flow(
Message-Id: <20200323062127.GF72691@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200318191209.1267-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200318191209.1267-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: dan.j.williams@intel.com, peter.ujfalusi@ti.com, grygorii.strashko@ti.com, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 18-03-20, 20:12, Christophe JAILLET wrote:
> All but one error handling paths in the 'k3_udma_glue_cfg_rx_flow()'
> function 'goto err' and call 'k3_udma_glue_release_rx_flow()'.
> 
> This not correct because this function has a 'channel->flows_ready--;' at
> the end, but 'flows_ready' has not been incremented here, when we branch to
> the error handling path.
> 
> In order to keep a correct value in 'flows_ready', un-roll
> 'k3_udma_glue_release_rx_flow()', simplify it, add some labels and branch
> at the correct places when an error is detected.
> 
> Doing so, we also NULLify 'flow->udma_rflow' in a path that was lacking it.

Applied, thanks

-- 
~Vinod
