From: Vinod Koul <vkoul@kernel.org>
Date: Wed, 02 Jan 2019 06:15:24 +0000
Subject: Re: [PATCH 12/20] dmaengine: dw: drop useless LIST_HEAD
Message-Id: <20190102060324.GF7581@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Viresh Kumar <vireshk@kernel.org>, kernel-janitors@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org

On 23-12-18, 09:57, Julia Lawall wrote:
> Drop LIST_HEAD where the variable it declares is never used.
> 
> Commit ab703f818ac3 ("dmaengine: dw: lazy allocation of dma
> descriptors") removed the uses, but not the declaration.
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

Applied, thanks

-- 
~Vinod
