From: Hans de Goede <hdegoede@redhat.com>
Date: Wed, 13 Jan 2021 09:25:56 +0000
Subject: Re: [PATCH][next] platform/surface: fix potential integer overflow on shift of a int
Message-Id: <e4092c8d-8857-ad95-065b-f72e774dfbb6@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210111144648.20498-1-colin.king@canonical.com>
In-Reply-To: <20210111144648.20498-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Maximilian Luz <luzmaximilian@gmail.com>, Mark Gross <mgross@linux.intel.com>, platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

On 1/11/21 3:46 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The left shift of int 32 bit integer constant 1 is evaluated using 32 bit
> arithmetic and then passed as a 64 bit function argument. In the case where
> func is 32 or more this can lead to an oveflow.  Avoid this by shifting
> using the BIT_ULL macro instead.
> 
> Addresses-Coverity: ("Unintentional integer overflow")
> Fixes: fc00bc8ac1da ("platform/surface: Add Surface ACPI Notify driver")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

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
>  drivers/platform/surface/surface_acpi_notify.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/surface/surface_acpi_notify.c b/drivers/platform/surface/surface_acpi_notify.c
> index 8cd67a669c86..ef9c1f8e8336 100644
> --- a/drivers/platform/surface/surface_acpi_notify.c
> +++ b/drivers/platform/surface/surface_acpi_notify.c
> @@ -188,7 +188,7 @@ static int san_acpi_notify_event(struct device *dev, u64 func,
>  	union acpi_object *obj;
>  	int status = 0;
>  
> -	if (!acpi_check_dsm(san, &SAN_DSM_UUID, SAN_DSM_REVISION, 1 << func))
> +	if (!acpi_check_dsm(san, &SAN_DSM_UUID, SAN_DSM_REVISION, BIT_ULL(func)))
>  		return 0;
>  
>  	dev_dbg(dev, "notify event %#04llx\n", func);
> 
