From: Vinod Koul <vkoul@kernel.org>
Date: Wed, 02 Jan 2019 06:16:55 +0000
Subject: Re: [PATCH 07/20] dmaengine: at_hdmac: drop useless LIST_HEAD
Message-Id: <20190102060455.GJ7581@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, kernel-janitors@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org

On 23-12-18, 09:57, Julia Lawall wrote:
> Drop LIST_HEAD where the variable it declares is never used.
> 
> tmp_list has been declared since the introduction of the driver
> and has never been used.  The two declarations of list were
> introduced with the containing functions but were also not used.
> 
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> identifier x;
> @@
> - LIST_HEAD(x);
>   ... when != x
> // </smpl>

Applied with Ludovic's ack, thanks

-- 
~Vinod
