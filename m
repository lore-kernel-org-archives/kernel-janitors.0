From: Florian Fainelli <f.fainelli@gmail.com>
Date: Mon, 21 Sep 2020 19:42:58 +0000
Subject: Re: [PATCH][next] PCI: brcmstb: fix a missing if statement on a return error check
Message-Id: <c9d7435b-42a1-2e40-7d40-62d227523f79@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200921144017.334602-1-colin.king@canonical.com>
In-Reply-To: <20200921144017.334602-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, bcm-kernel-feedback-list@broadcom.com, Jim Quinlan <jquinlan@broadcom.com>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 9/21/20 7:40 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The error return ret is not being check with an if statement and
> currently the code always returns leaving the following code as
> dead code. Fix this by adding in the missing if statement.
> 
> Addresses-Coverity: ("Structurally dead code")
> Fixes: ad3d29c77e1e ("PCI: brcmstb: Add control of rescal reset")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/pci/controller/pcie-brcmstb.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index 7a3ff4632e7c..cb0c11b7308e 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -1154,6 +1154,7 @@ static int brcm_pcie_resume(struct device *dev)
>  	clk_prepare_enable(pcie->clk);
>  
>  	ret = brcm_phy_start(pcie);
> +	if (ret)
>  		return ret;

Maybe this should also disable the clock if we failed to start the PHY
somehow.
-- 
Florian
