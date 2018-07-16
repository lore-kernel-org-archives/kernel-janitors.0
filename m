From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Mon, 16 Jul 2018 11:26:34 +0000
Subject: Re: [PATCH] drm/vkms: off by one in vkms_gem_fault()
Message-Id: <20180716112634.jpxifuvjfzmralsq@smtp.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180714104951.akt34gkcq54d5pvl@kili.mountain>
In-Reply-To: <20180714104951.akt34gkcq54d5pvl@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

Hi Dan,

Thanks for your patch. I checked and tested it, everything is fine.

On 07/14, Dan Carpenter wrote:
> The > should be >= so that we don't read one page beyond the end of the
> obj->pages[] array.
> 
> Fixes: 559e50fd34d1 ("drm/vkms: Add dumb operations")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_gem.c b/drivers/gpu/drm/vkms/vkms_gem.c
> index c7e38368602b..2cca8c2f260f 100644
> --- a/drivers/gpu/drm/vkms/vkms_gem.c
> +++ b/drivers/gpu/drm/vkms/vkms_gem.c
> @@ -55,7 +55,7 @@ int vkms_gem_fault(struct vm_fault *vmf)
>  	page_offset = (vaddr - vma->vm_start) >> PAGE_SHIFT;
>  	num_pages = DIV_ROUND_UP(obj->gem.size, PAGE_SIZE);
>  
> -	if (page_offset > num_pages)
> +	if (page_offset >= num_pages)
>  		return VM_FAULT_SIGBUS;
>  
>  	ret = -ENOENT;

Reviewed-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
