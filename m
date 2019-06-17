From: Suzuki K Poulose <suzuki.poulose@arm.com>
Date: Mon, 17 Jun 2019 08:25:13 +0000
Subject: Re: [PATCH -next] coresight: replicator: Add terminate entry for acpi_device_id tables
Message-Id: <06c751dc-0a23-b33b-1ff1-a98d6503408c@arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190615104440.94149-1-weiyongjun1@huawei.com>
In-Reply-To: <20190615104440.94149-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com, mathieu.poirier@linaro.org, alexander.shishkin@linux.intel.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi

Thanks for the fix, please find my comment below.

On 15/06/2019 11:44, Wei Yongjun wrote:
> Make sure acpi_device_id tables have terminate entry.
> 
> Fixes: 8f35caae1e1f ("coresight: acpi: Support for platform devices")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>   drivers/hwtracing/coresight/coresight-replicator.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index 542952759941..0c73dc1073c0 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -300,6 +300,7 @@ static const struct of_device_id static_replicator_match[] = {
>   #ifdef CONFIG_ACPI
>   static const struct acpi_device_id static_replicator_acpi_ids[] = {
>   	{"ARMHC985", 0}, /* ARM CoreSight Static Replicator */
> +	{"", 0},

nit: I would leave it {}, instead of creating an empty string.

With that :

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
