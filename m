From: Vinod Koul <vkoul@kernel.org>
Date: Wed, 02 Jan 2019 06:16:04 +0000
Subject: Re: [PATCH 17/20] dmaengine: pl330: drop useless LIST_HEAD
Message-Id: <20190102060404.GH7581@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Dan Williams <dan.j.williams@intel.com>, kernel-janitors@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org

On 23-12-18, 09:57, Julia Lawall wrote:
> Drop LIST_HEAD where the variable it declares is never used.
> 
> The variable has not been used since the function was introduced
> in 740aa95703c5 ("dmaengine: pl330: Split device_control").
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
