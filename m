From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 18 Jun 2019 16:57:14 +0000
Subject: Re: [PATCH -next v2] coresight: replicator: Add terminate entry for acpi_device_id tables
Message-Id: <CANLsYkyQMB5q9kavLLBwGjhq7sXLNBPPpWaaEip+6DnRahA4oQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190615104440.94149-1-weiyongjun1@huawei.com>
 <20190617092253.167231-1-weiyongjun1@huawei.com>
In-Reply-To: <20190617092253.167231-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Suzuki K Poulose <suzuki.poulose@arm.com>

On Mon, 17 Jun 2019 at 03:15, Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> Make sure acpi_device_id tables have terminate entry.
>
> Fixes: fe446287ec9f ("coresight: acpi: Support for platform devices")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-replicator.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
> index 542952759941..b7d6d59d56db 100644
> --- a/drivers/hwtracing/coresight/coresight-replicator.c
> +++ b/drivers/hwtracing/coresight/coresight-replicator.c
> @@ -300,6 +300,7 @@ static const struct of_device_id static_replicator_match[] = {
>  #ifdef CONFIG_ACPI
>  static const struct acpi_device_id static_replicator_acpi_ids[] = {
>         {"ARMHC985", 0}, /* ARM CoreSight Static Replicator */
> +       {}

Applied - thanks

>  };
>  #endif
>
>
>
