From: Vinod Koul <vkoul@kernel.org>
Date: Mon, 05 Oct 2020 04:48:28 +0000
Subject: Re: [PATCH 04/14] dmaengine: sh: drop double zeroing
Message-Id: <20201005044819.GJ2968@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
 <1600601186-7420-5-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1600601186-7420-5-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Dan Williams <dan.j.williams@intel.com>, kernel-janitors@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org

On 20-09-20, 13:26, Julia Lawall wrote:
> sg_init_table zeroes its first argument, so the allocation of that argument
> doesn't have to.
> 
> the semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)

Applied, thanks

-- 
~Vinod
