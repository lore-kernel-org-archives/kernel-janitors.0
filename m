From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 Oct 2019 13:33:57 +0000
Subject: Re: [PATCH] net: stmmac: xgmac: add missing parentheses to fix precendence error
Message-Id: <20191002133356.GP22609@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191002110849.13405-1-colin.king@canonical.com>
In-Reply-To: <20191002110849.13405-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org

On Wed, Oct 02, 2019 at 12:08:49PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The expression !(hw_cap & XGMAC_HWFEAT_RAVSEL) >> 10 is always zero, so
> the masking operation is incorrect. Fix this by adding the missing
> parentheses to correctly bind the negate operator on the entire expression.
> 
> Addresses-Coverity: ("Operands don't affect result")
> Fixes: c2b69474d63b ("net: stmmac: xgmac: Correct RAVSEL field interpretation")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> index 965cbe3e6f51..2e814aa64a5c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> @@ -369,7 +369,7 @@ static void dwxgmac2_get_hw_feature(void __iomem *ioaddr,
>  	dma_cap->eee = (hw_cap & XGMAC_HWFEAT_EEESEL) >> 13;
>  	dma_cap->atime_stamp = (hw_cap & XGMAC_HWFEAT_TSSEL) >> 12;
>  	dma_cap->av = (hw_cap & XGMAC_HWFEAT_AVSEL) >> 11;
> -	dma_cap->av &= !(hw_cap & XGMAC_HWFEAT_RAVSEL) >> 10;
> +	dma_cap->av &= !((hw_cap & XGMAC_HWFEAT_RAVSEL) >> 10);

There is no point to the shift at all.

regards,
dan carpenter
