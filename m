From: Vinod Koul <vkoul@kernel.org>
Date: Wed, 02 Jan 2019 06:16:23 +0000
Subject: Re: [PATCH 18/20] dmaengine: sa11x0: drop useless LIST_HEAD
Message-Id: <20190102060423.GI7581@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Dan Williams <dan.j.williams@intel.com>, kernel-janitors@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org

On 23-12-18, 09:57, Julia Lawall wrote:
> Drop LIST_HEAD where the variable it declares has never been
> used.
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
