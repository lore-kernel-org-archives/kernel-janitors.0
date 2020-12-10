From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Thu, 10 Dec 2020 21:55:40 +0000
Subject: Re: [PATCH] coresight: cti: =?utf-8?Q?Redu?= =?utf-8?Q?ce_scope_for_the_variable_=E2=80=9Ccs=5Ffwnod
Message-Id: <20201210215540.GA1860012@xps15>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c1b09b27-9012-324f-28d0-ba820dc468a5@web.de>
In-Reply-To: <c1b09b27-9012-324f-28d0-ba820dc468a5@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: "Suzuki K. Poulose" <suzuki.poulose@arm.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Leo Yan <leo.yan@linaro.org>, linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>

On Wed, Dec 09, 2020 at 09:42:20PM +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 9 Dec 2020 21:34:48 +0100
> 
> A local variable was used only within an else branch.
> Thus move the definition for the variable “cs_fwnode” into
> the corresponding code block.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/hwtracing/coresight/coresight-cti-platform.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
> index 98f830c6ed50..ccef04f27f12 100644
> --- a/drivers/hwtracing/coresight/coresight-cti-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
> @@ -343,7 +343,6 @@ static int cti_plat_create_connection(struct device *dev,
>  {
>  	struct cti_trig_con *tc = NULL;
>  	int cpuid = -1, err = 0;
> -	struct fwnode_handle *cs_fwnode = NULL;
>  	struct coresight_device *csdev = NULL;
>  	const char *assoc_name = "unknown";
>  	char cpu_name_str[16];
> @@ -397,8 +396,9 @@ static int cti_plat_create_connection(struct device *dev,
>  		assoc_name = cpu_name_str;
>  	} else {
>  		/* associated device ? */
> -		cs_fwnode = fwnode_find_reference(fwnode,
> -						  CTI_DT_CSDEV_ASSOC, 0);
> +		struct fwnode_handle *cs_fwnode = fwnode_find_reference(fwnode,
> +									CTI_DT_CSDEV_ASSOC,
> +									0);

I have applied your patch.

Thanks,
Mathieu

>  		if (!IS_ERR(cs_fwnode)) {
>  			assoc_name = cti_plat_get_csdev_or_node_name(cs_fwnode,
>  								     &csdev);
> --
> 2.29.2
> 
