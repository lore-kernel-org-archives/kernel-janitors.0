From: Hans de Goede <hdegoede@redhat.com>
Date: Wed, 13 Jan 2021 09:29:24 +0000
Subject: Re: [PATCH] platform/surface: aggregator: prevent information leak in ssam_cdev_request()
Message-Id: <de261fcb-7362-3c03-eecd-292e0a0038a5@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X/6sVaewHLPzv00U@mwanda>
In-Reply-To: <X/6sVaewHLPzv00U@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Maximilian Luz <luzmaximilian@gmail.com>
Cc: Mark Gross <mgross@linux.intel.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

On 1/13/21 9:16 AM, Dan Carpenter wrote:
> If copy_struct_from_user() fails at the start of the function then this
> function calls put_user(rsp.length, &r->response.length) before
> "rsp.length" is set to zero.  That is a potential security issue because
> it discloses kernel stack data to user space.
> 
> Fixes: 178f6ab77e61 ("platform/surface: Add Surface Aggregator user-space interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thank you for your patch, another fix for this was already submitted:
https://patchwork.kernel.org/project/platform-driver-x86/patch/20210111154851.325404-2-luzmaximilian@gmail.com/

So I'm dropping this patch from my queue.

Regards,

Hans



> ---
>  drivers/platform/surface/surface_aggregator_cdev.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/surface/surface_aggregator_cdev.c b/drivers/platform/surface/surface_aggregator_cdev.c
> index 340d15b148b9..05e9eb118d76 100644
> --- a/drivers/platform/surface/surface_aggregator_cdev.c
> +++ b/drivers/platform/surface/surface_aggregator_cdev.c
> @@ -67,7 +67,7 @@ static long ssam_cdev_request(struct ssam_cdev *cdev, unsigned long arg)
>  	struct ssam_cdev_request __user *r;
>  	struct ssam_cdev_request rqst;
>  	struct ssam_request spec;
> -	struct ssam_response rsp;
> +	struct ssam_response rsp = {};
>  	const void __user *plddata;
>  	void __user *rspdata;
>  	int status = 0, ret = 0, tmp;
> @@ -96,8 +96,6 @@ static long ssam_cdev_request(struct ssam_cdev *cdev, unsigned long arg)
>  		spec.flags |= SSAM_REQUEST_UNSEQUENCED;
>  
>  	rsp.capacity = rqst.response.length;
> -	rsp.length = 0;
> -	rsp.pointer = NULL;
>  
>  	/* Get request payload from user-space. */
>  	if (spec.length) {
> 
