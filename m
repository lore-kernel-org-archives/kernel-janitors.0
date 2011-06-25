From: Ben Skeggs <bskeggs@redhat.com>
Date: Sat, 25 Jun 2011 11:59:07 +0000
Subject: Re: [patch] nouveau: free the memory in nouveau_gart_manager_del()
Message-Id: <1309003308.3557.4.camel@nisroch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110625055324.GS14591@shale.localdomain>
In-Reply-To: <20110625055324.GS14591@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Roy Spliet <r.spliet@student.tudelft.nl>, "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>

On Sat, 2011-06-25 at 08:53 +0300, Dan Carpenter wrote:
> In the original code the kfree() doesn't do anything because
> "mem->mm_node" has been set to NULL.  This was introduced in
> d2f96666c56a "drm/nouveau: create temp vmas for both src and dst of
> bo moves"
Already fixed in nouveau git, I'll get the fixes to Dave.

Ben.

> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
> index 765f0e5..ab79bf8 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_mem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
> @@ -846,8 +846,8 @@ nouveau_gart_manager_del(struct ttm_mem_type_manager *man,
>  			 struct ttm_mem_reg *mem)
>  {
>  	nouveau_mem_node_cleanup(mem->mm_node);
> -	mem->mm_node = NULL;
>  	kfree(mem->mm_node);
> +	mem->mm_node = NULL;
>  }
>  
>  static int


