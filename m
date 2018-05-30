From: Bjorn Helgaas <helgaas@kernel.org>
Date: Wed, 30 May 2018 15:52:58 +0000
Subject: Re: [PATCH -next] PCI: mobiveil: Add terminate entry for of_device_id tables
Message-Id: <20180530155258.GE39853@bhelgaas-glaptop.roam.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1527327308-69566-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1527327308-69566-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Subrahmanya Lingappa <l.subrahmanya@mobiveil.co.in>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, May 26, 2018 at 09:35:08AM +0000, Wei Yongjun wrote:
> Make sure of_device_id tables are NULL terminated.
> 
> Fixes: 0db7e807fa68 ("PCI: mobiveil: Add Mobiveil PCIe Host Bridge IP driver")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Thanks, I folded this into 0db7e807fa68, since it hasn't been merged to
Linus' tree yet.

Lorenzo, I just cherry-picked your lorenzo/pci/mobiveil branch to my
pci/host/mobiveil branch to make this happen, so you can drop your branch.

> ---
>  drivers/pci/host/pcie-mobiveil.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/host/pcie-mobiveil.c b/drivers/pci/host/pcie-mobiveil.c
> index f3fbe9d..4d6c20e 100644
> --- a/drivers/pci/host/pcie-mobiveil.c
> +++ b/drivers/pci/host/pcie-mobiveil.c
> @@ -845,6 +845,7 @@ static int mobiveil_pcie_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id mobiveil_pcie_of_match[] = {
>  	{.compatible = "mbvl,gpex40-pcie",},
> +	{},
>  };
>  
>  MODULE_DEVICE_TABLE(of, mobiveil_pcie_of_match);
> 
