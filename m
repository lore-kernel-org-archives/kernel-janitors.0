From: Hans de Goede <hdegoede@redhat.com>
Date: Tue, 24 Nov 2020 11:44:08 +0000
Subject: Re: [PATCH] platform/x86: pmt: Fix a potential Oops on error in probe
Message-Id: <3a84cc88-25d2-7265-6183-41337109df87@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201117072251.GC1111239@mwanda>
In-Reply-To: <20201117072251.GC1111239@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, "David E. Box" <david.e.box@linux.intel.com>, Alexander Duyck <alexander.h.duyck@linux.intel.com>
Cc: Mark Gross <mgross@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

On 11/17/20 8:22 AM, Dan Carpenter wrote:
> The "ns->attr_grp" pointer can be NULL so this error handling code needs
> to check for that to avoid an Oops.
> 
> Fixes: e2729113ce66 ("platform/x86: Intel PMT class driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  drivers/platform/x86/intel_pmt_class.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel_pmt_class.c b/drivers/platform/x86/intel_pmt_class.c
> index aa88dc23bbde..c8939fba4509 100644
> --- a/drivers/platform/x86/intel_pmt_class.c
> +++ b/drivers/platform/x86/intel_pmt_class.c
> @@ -225,7 +225,8 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
>  		return 0;
>  
>  fail_ioremap:
> -	sysfs_remove_group(entry->kobj, ns->attr_grp);
> +	if (ns->attr_grp)
> +		sysfs_remove_group(entry->kobj, ns->attr_grp);
>  fail_sysfs:
>  	device_unregister(dev);
>  fail_dev_create:
> 
