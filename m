From: Shawn Lin <shawn.lin@rock-chips.com>
Date: Wed, 12 Oct 2016 11:04:11 +0000
Subject: Re: [patch] PCI: rockchip: Indent an if statement
Message-Id: <2916ad6b-e6a4-b221-5820-c1c5f9387f76@rock-chips.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161012105409.GA19070@mwanda>
In-Reply-To: <20161012105409.GA19070@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Shawn Lin <shawn.lin@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org, Wenrui Li <wenrui.li@rock-chips.com>, kernel-janitors@vger.kernel.org, linux-rockchip@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>

On 2016/10/12 18:54, Dan Carpenter wrote:
> The if statement wasn't intended.  Add a tab.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for this patch.

Currently the driver is under cleanup, so it would be fine
for Bjorn to pick it up for host-rockchip branch. :)

>
> diff --git a/drivers/pci/host/pcie-rockchip.c b/drivers/pci/host/pcie-rockchip.c
> index b8c82fc..f54ef1e 100644
> --- a/drivers/pci/host/pcie-rockchip.c
> +++ b/drivers/pci/host/pcie-rockchip.c
> @@ -972,7 +972,7 @@ static int rockchip_pcie_prog_ob_atu(struct rockchip_pcie *rockchip,
>  		return -EINVAL;
>  	if (region_no = 0) {
>  		if (AXI_REGION_0_SIZE < (2ULL << num_pass_bits))
> -		return -EINVAL;
> +			return -EINVAL;
>  	}
>  	if (region_no != 0) {
>  		if (AXI_REGION_SIZE < (2ULL << num_pass_bits))
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
>


-- 
Best Regards
Shawn Lin

