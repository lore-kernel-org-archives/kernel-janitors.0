From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 01 Mar 2019 07:25:43 +0000
Subject: Re: [PATCH -next] PCI: aardvark: Make symbol 'advk_pci_bridge_emul_ops' static
Message-Id: <20190301082543.5ba5f4c6@windsurf.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190301065809.66046-1-weiyongjun1@huawei.com>
In-Reply-To: <20190301065809.66046-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Zachary Zhang <zhangzg@marvell.com>, linux-arm-kernel@lists.infradead.org

Hello Wei,

On Fri, 1 Mar 2019 06:58:09 +0000
Wei Yongjun <weiyongjun1@huawei.com> wrote:

> Fixes the following sparse warning:
> 
> drivers/pci/controller/pci-aardvark.c:469:28: warning:
>  symbol 'advk_pci_bridge_emul_ops' was not declared. Should it be static?
> 
> Fixes: 8a3ebd8de328 ("PCI: aardvark: Implement emulated root PCI bridge config space")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
