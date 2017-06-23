From: David Miller <davem@davemloft.net>
Date: Fri, 23 Jun 2017 17:58:52 +0000
Subject: Re: [PATCH] net: stmmac: make some functions static
Message-Id: <20170623.135852.116857192416960869.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170622161729.23602-1-colin.king@canonical.com>
In-Reply-To: <20170622161729.23602-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: peppe.cavallaro@st.com, alexandre.torgue@st.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu, 22 Jun 2017 17:17:29 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The functions dwmac4_dma_init_rx_chan, dwmac4_dma_init_tx_chan and
> dwmac4_dma_init_channel do not need to be in global scope, so them
> static.
> 
> Cleans up sparse warnings:
> "symbol 'dwmac4_dma_init_rx_chan' was not declared. Should it be static?"
> "symbol 'dwmac4_dma_init_tx_chan' was not declared. Should it be static?"
> "symbol 'dwmac4_dma_init_channel' was not declared. Should it be static?"
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next, thanks.
