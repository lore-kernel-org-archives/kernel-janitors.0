From: David Miller <davem@davemloft.net>
Date: Fri, 22 Jun 2018 00:31:50 +0000
Subject: Re: [PATCH] net: ethernet: ti: davinci_cpdma: make function cpdma_desc_pool_create static
Message-Id: <20180622.093150.372475753380132826.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180621171645.29734-1-colin.king@canonical.com>
In-Reply-To: <20180621171645.29734-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: f.fainelli@gmail.com, ivan.khoronzhuk@linaro.org, linux-omap@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu, 21 Jun 2018 18:16:45 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The function cpdma_desc_pool_create is local to the source and does not
> need to be in global scope, so make it static.
> 
> Cleans up sparse warning:
> warning: symbol 'cpdma_desc_pool_create' was not declared. Should it
> be static?
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks Colin.
