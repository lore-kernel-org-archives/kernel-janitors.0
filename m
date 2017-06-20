From: Vivek Gautam <vivek.gautam@codeaurora.org>
Date: Tue, 20 Jun 2017 08:38:35 +0000
Subject: Re: [PATCH] phy: brcm-sata: fix a timeout test in init
Message-Id: <69b479f4-8939-4c11-2c16-2e188e02a625@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170619105251.GA23911@elgon.mountain>
In-Reply-To: <20170619105251.GA23911@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>, Heiko Stuebner <heiko@sntech.de>, Florian Fainelli <f.fainelli@gmail.com>, Axel Lin <axel.lin@ingics.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On 06/19/2017 04:26 PM, Dan Carpenter wrote:
> We want to timeout with try set to zero so this should be a pre-op
> instead of post-op.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/phy/broadcom/phy-brcm-sata.c b/drivers/phy/broadcom/phy-brcm-sata.c
> index ccbc3d994998..48fb016ce689 100644
> --- a/drivers/phy/broadcom/phy-brcm-sata.c
> +++ b/drivers/phy/broadcom/phy-brcm-sata.c
> @@ -329,7 +329,7 @@ static int brcm_nsp_sata_init(struct brcm_sata_port *port)
>   
>   	/* Wait for pll_seq_done bit */
>   	try = 50;
> -	while (try--) {
> +	while (--try) {

Do we want to try reading the status 50 times? If yes, won't your change
break that? It will rather run the loop 49 times.

Thanks
Vivek

>   		val = brcm_sata_phy_rd(base, BLOCK0_REG_BANK,
>   					BLOCK0_XGXSSTATUS);
>   		if (val & BLOCK0_XGXSSTATUS_PLL_LOCK)

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

