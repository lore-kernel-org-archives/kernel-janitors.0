From: Bjorn Helgaas <helgaas@kernel.org>
Date: Wed, 26 Sep 2018 19:24:53 +0000
Subject: Re: [PATCH -next] PCI: hotplug: Remove set but not used variable 'physical_slot'
Message-Id: <20180926192453.GD28024@bhelgaas-glaptop.roam.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1537959962-83251-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1537959962-83251-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Kees Cook <keescook@chromium.org>, Markus Elfring <elfring@users.sourceforge.net>, Frederick Lawler <fred@fredlawl.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Lukas Wunner <lukas@wunner.de>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Sep 26, 2018 at 11:06:02AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/pci/hotplug/cpqphp_core.c: In function 'init_SERR':
> drivers/pci/hotplug/cpqphp_core.c:124:5: warning:
>  variable 'physical_slot' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied to pci/hotplug for v4.20, thanks!

> ---
>  drivers/pci/hotplug/cpqphp_core.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/pci/hotplug/cpqphp_core.c b/drivers/pci/hotplug/cpqphp_core.c
> index 95b7d60..16bbb18 100644
> --- a/drivers/pci/hotplug/cpqphp_core.c
> +++ b/drivers/pci/hotplug/cpqphp_core.c
> @@ -121,7 +121,6 @@ static int init_SERR(struct controller *ctrl)
>  {
>  	u32 tempdword;
>  	u32 number_of_slots;
> -	u8 physical_slot;
>  
>  	if (!ctrl)
>  		return 1;
> @@ -131,7 +130,6 @@ static int init_SERR(struct controller *ctrl)
>  	number_of_slots = readb(ctrl->hpc_reg + SLOT_MASK) & 0x0F;
>  	/* Loop through slots */
>  	while (number_of_slots) {
> -		physical_slot = tempdword;
>  		writeb(0, ctrl->hpc_reg + SLOT_SERR);
>  		tempdword++;
>  		number_of_slots--;
> 
