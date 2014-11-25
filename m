From: Oded Gabbay <oded.gabbay@amd.com>
Date: Tue, 25 Nov 2014 12:27:30 +0000
Subject: Re: [patch] amdkfd: fix some error handling in ioctl
Message-Id: <547475B2.9040108@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141125102129.GB23215@mwanda>
In-Reply-To: <20141125102129.GB23215@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Andrew Lewycky <Andrew.Lewycky@amd.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

On 11/25/2014 12:21 PM, Dan Carpenter wrote:
> There is a typo here so the errors from kfd_bind_process_to_device()
> are not detected.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>

Patch is:
Reviewed-by: Oded Gabbay <oded.gabbay@amd.com>
And applied to my 3.19-next-wip tree

	Oded

> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 64c73ba..c5dd0ae 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -236,7 +236,7 @@ static long kfd_ioctl_create_queue(struct file *filep, struct kfd_process *p,
>   	mutex_lock(&p->mutex);
>
>   	pdd = kfd_bind_process_to_device(dev, p);
> -	if (IS_ERR(pdd) < 0) {
> +	if (IS_ERR(pdd)) {
>   		err = PTR_ERR(pdd);
>   		goto err_bind_process;
>   	}
> @@ -381,7 +381,7 @@ static long kfd_ioctl_set_memory_policy(struct file *filep,
>   	mutex_lock(&p->mutex);
>
>   	pdd = kfd_bind_process_to_device(dev, p);
> -	if (IS_ERR(pdd) < 0) {
> +	if (IS_ERR(pdd)) {
>   		err = PTR_ERR(pdd);
>   		goto out;
>   	}
>
