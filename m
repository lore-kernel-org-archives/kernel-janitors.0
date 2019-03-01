From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Date: Fri, 01 Mar 2019 15:29:21 +0000
Subject: Re: [PATCH -next] PCI: aardvark: Make symbol 'advk_pci_bridge_emul_ops' static
Message-Id: <20190301152921.GA7771@e107981-ln.cambridge.arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190301065809.66046-1-weiyongjun1@huawei.com>
In-Reply-To: <20190301065809.66046-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bjorn Helgaas <bhelgaas@google.com>, Zachary Zhang <zhangzg@marvell.com>, linux-arm-kernel@lists.infradead.org

On Fri, Mar 01, 2019 at 06:58:09AM +0000, Wei Yongjun wrote:
> Fixes the following sparse warning:
> 
> drivers/pci/controller/pci-aardvark.c:469:28: warning:
>  symbol 'advk_pci_bridge_emul_ops' was not declared. Should it be static?
> 
> Fixes: 8a3ebd8de328 ("PCI: aardvark: Implement emulated root PCI bridge config space")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/pci/controller/pci-aardvark.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to pci/misc for v5.1, thanks.

Lorenzo

> diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
> index 6eecae447af3..eb58dfdaba1b 100644
> --- a/drivers/pci/controller/pci-aardvark.c
> +++ b/drivers/pci/controller/pci-aardvark.c
> @@ -466,7 +466,7 @@ advk_pci_bridge_emul_pcie_conf_write(struct pci_bridge_emul *bridge,
>  	}
>  }
>  
> -struct pci_bridge_emul_ops advk_pci_bridge_emul_ops = {
> +static struct pci_bridge_emul_ops advk_pci_bridge_emul_ops = {
>  	.read_pcie = advk_pci_bridge_emul_pcie_conf_read,
>  	.write_pcie = advk_pci_bridge_emul_pcie_conf_write,
>  };
> 
> 
> 
