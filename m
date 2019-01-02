From: Vinod Koul <vkoul@kernel.org>
Date: Wed, 02 Jan 2019 06:15:47 +0000
Subject: Re: [PATCH 14/20] dmaengine: st_fdma: drop useless LIST_HEAD
Message-Id: <20190102060347.GG7581@vkoul-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Patrice Chotard <patrice.chotard@st.com>, kernel-janitors@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org

On 23-12-18, 09:57, Julia Lawall wrote:
> Drop LIST_HEAD where the variable it declares is never used.
> 
> The declarations were introduced with the file, but the declared
> variables were not used.
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
> 
> Fixes: 6b4cd727eaf1 ("dmaengine: st_fdma: Add STMicroelectronics FDMA engine driver support")
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied, thanks

-- 
~Vinod
