From: Hanjun Guo <hanjun.guo@linaro.org>
Date: Wed, 18 Jan 2017 02:09:50 +0000
Subject: Re: [patch] ACPI/IORT: fix an error code
Message-Id: <a128a6c8-0be3-5fb8-914e-0554141f4d53@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170117121910.GA29263@mwanda>
In-Reply-To: <20170117121910.GA29263@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2017/1/17 21:36, Dan Carpenter wrote:
> We accidentally return success if platform_device_alloc() fails.
>
> Fixes: 846f0e9e74a0 ("ACPI/IORT: Add support for ARM SMMU platform devices creation")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> index e0d2e6e..655407a 100644
> --- a/drivers/acpi/arm64/iort.c
> +++ b/drivers/acpi/arm64/iort.c
> @@ -828,7 +828,7 @@ static int __init iort_add_smmu_platform_device(struct acpi_iort_node *node)
>
>  	pdev = platform_device_alloc(ops->name, PLATFORM_DEVID_AUTO);
>  	if (!pdev)
> -		return PTR_ERR(pdev);
> +		return -ENOMEM;
>
>  	count = ops->iommu_count_resources(node);

Acked-by: Hanjun Guo <hanjun.guo@linaro.org>

Thanks
Hanjun
