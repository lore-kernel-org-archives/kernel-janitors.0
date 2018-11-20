From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Date: Tue, 20 Nov 2018 11:37:18 +0000
Subject: Re: [PATCH] PCI: histb: constify dw_pcie_host_ops structure
Message-Id: <20181120113718.GA20893@e107981-ln.cambridge.arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1540665079-27788-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1540665079-27788-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Jianguo Sun <sunjianguo1@huawei.com>, kernel-janitors@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Oct 27, 2018 at 08:31:19PM +0200, Julia Lawall wrote:
> The dw_pcie_host_ops structure is only stored in the ops field
> of a pcie_port structure, and this field is const, so make the
> dw_pcie_host_ops structure const as well.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---
>  drivers/pci/controller/dwc/pcie-histb.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to pci/dwc for v4.21, thanks.

Lorenzo

> diff -u -p a/drivers/pci/controller/dwc/pcie-histb.c b/drivers/pci/controller/dwc/pcie-histb.c
> --- a/drivers/pci/controller/dwc/pcie-histb.c
> +++ b/drivers/pci/controller/dwc/pcie-histb.c
> @@ -202,7 +202,7 @@ static int histb_pcie_host_init(struct p
>  	return 0;
>  }
>  
> -static struct dw_pcie_host_ops histb_pcie_host_ops = {
> +static const struct dw_pcie_host_ops histb_pcie_host_ops = {
>  	.rd_own_conf = histb_pcie_rd_own_conf,
>  	.wr_own_conf = histb_pcie_wr_own_conf,
>  	.host_init = histb_pcie_host_init,
> 
