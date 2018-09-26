From: Bjorn Helgaas <helgaas@kernel.org>
Date: Wed, 26 Sep 2018 19:24:40 +0000
Subject: Re: [PATCH -next] PCI/AER: Remove duplicated include from err.c
Message-Id: <20180926192440.GC28024@bhelgaas-glaptop.roam.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1537959610-71713-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1537959610-71713-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Russell Currey <ruscur@russell.cc>, Sam Bobroff <sbobroff@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Sep 26, 2018 at 11:00:10AM +0000, YueHaibing wrote:
> Remove duplicated include.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied to pci/hotplug for v4.20, thanks!

> ---
>  drivers/pci/pcie/err.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index 4da2a62b..773197a 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -12,7 +12,6 @@
>  
>  #include <linux/pci.h>
>  #include <linux/module.h>
> -#include <linux/pci.h>
>  #include <linux/kernel.h>
>  #include <linux/errno.h>
>  #include <linux/aer.h>
> 
> 
> 
