From: Niklas Cassel <niklas.cassel@linaro.org>
Date: Wed, 23 Jan 2019 10:39:15 +0000
Subject: Re: [PATCH net-next] net: stmmac: Fix return value check in qcom_ethqos_probe()
Message-Id: <20190123103915.GA20558@centauri.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1548224358-83281-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1548224358-83281-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org

On Wed, Jan 23, 2019 at 06:19:18AM +0000, Wei Yongjun wrote:
> In case of error, the function devm_clk_get() returns ERR_PTR() and
> never returns NULL. The NULL test in the return value check should be
> replaced with IS_ERR().
> 
> Fixes: a7c30e62d4b8 ("net: stmmac: Add driver for Qualcomm ethqos")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 30724bd..7ec8954 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -473,8 +473,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  	ethqos->por = of_device_get_match_data(&pdev->dev);
>  
>  	ethqos->rgmii_clk = devm_clk_get(&pdev->dev, "rgmii");
> -	if (!ethqos->rgmii_clk) {
> -		ret = -ENOMEM;
> +	if (IS_ERR(ethqos->rgmii_clk)) {
> +		ret = PTR_ERR(ethqos->rgmii_clk);
>  		goto err_mem;
>  	}
> 
> 
> 

Acked-by: Niklas Cassel <niklas.cassel@linaro.org>
