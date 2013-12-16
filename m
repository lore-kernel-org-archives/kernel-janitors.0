From: Stephen Warren <swarren@wwwdotorg.org>
Date: Mon, 16 Dec 2013 16:55:47 +0000
Subject: Re: [patch] spi: tegra: checking for ERR_PTR instead of NULL
Message-Id: <52AF3093.30308@wwwdotorg.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131216140210.GA32033@elgon.mountain>
In-Reply-To: <20131216140210.GA32033@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Laxman Dewangan <ldewangan@nvidia.com>
Cc: Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, linux-spi@vger.kernel.org, linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org

On 12/16/2013 07:02 AM, Dan Carpenter wrote:
> dma_request_slave_channel() returns NULL on error and not ERR_PTRs.
> I've fixed this by using dma_request_slave_channel_reason() which does
> return ERR_PTRs.
> 
> Fixes: a915d150f68d ('spi: tegra: convert to standard DMA DT bindings')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Oops. I validate there aren't any more issues like this, at least in the
commits in the series this fixes.

I've applied this to Tegra's for-3.14/dmas-resets-rework branch, since
that's the only place where the commit this fixes exists.
