From: Sinan Kaya <okaya@codeaurora.org>
Date: Mon, 17 Apr 2017 22:23:33 +0000
Subject: Re: [PATCH] hidma_mgmt_sys: Use devm_kmalloc_array() in hidma_mgmt_init_sys()
Message-Id: <21cb2036-2bdb-9024-a07b-a72dab747b44@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <89811982-af2d-3ab3-0ab3-ddb6e4ca369f@users.sourceforge.net>
In-Reply-To: <89811982-af2d-3ab3-0ab3-ddb6e4ca369f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, dmaengine@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, Dan Williams <dan.j.williams@intel.com>, David Brown <david.brown@linaro.org>, Vinod Koul <vinod.koul@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 4/17/2017 4:55 PM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 17 Apr 2017 22:42:40 +0200
> 
> * A multiplication for the size determination of a memory allocation
>   indicated that an array data structure should be processed.
>   Thus use the corresponding function "devm_kmalloc_array".
> 
>   This issue was detected by using the Coccinelle software.
> 
> * Delete the local variable "required" which became unnecessary
>   with this refactoring.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/dma/qcom/hidma_mgmt_sys.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma/qcom/hidma_mgmt_sys.c b/drivers/dma/qcom/hidma_mgmt_sys.c
> index d61f1068a34b..e7222a0e9ba4 100644
> --- a/drivers/dma/qcom/hidma_mgmt_sys.c
> +++ b/drivers/dma/qcom/hidma_mgmt_sys.c
> @@ -245,11 +245,12 @@ int hidma_mgmt_init_sys(struct hidma_mgmt_dev *mdev)
>  {
>  	unsigned int i;
>  	int rc;
> -	int required;
>  	struct kobject *chanops;
>  
> -	required = sizeof(*mdev->chroots) * mdev->dma_channels;
> -	mdev->chroots = devm_kmalloc(&mdev->pdev->dev, required, GFP_KERNEL);
> +	mdev->chroots = devm_kmalloc_array(&mdev->pdev->dev,
> +					   mdev->dma_channels,
> +					   sizeof(*mdev->chroots),
> +					   GFP_KERNEL);
>  	if (!mdev->chroots)
>  		return -ENOMEM;
>  
> 

Reviewed-by: Sinan Kaya <okaya@codeauora.org>



-- 
Sinan Kaya
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project.
