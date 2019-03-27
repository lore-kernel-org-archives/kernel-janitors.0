From: Mukesh Ojha <mojha@codeaurora.org>
Date: Wed, 27 Mar 2019 14:59:29 +0000
Subject: Re: [PATCH v2 -next] drm/virtio: remove set but not used variable 'vgdev'
Message-Id: <17e9a0c2-63dd-ac97-49c6-aa70b5c8d221@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190320020308.12745-1-yuehaibing@huawei.com>
 <20190325092631.152060-1-yuehaibing@huawei.com>
In-Reply-To: <20190325092631.152060-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


On 3/25/2019 2:56 PM, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/gpu/drm/virtio/virtgpu_ttm.c: In function 'virtio_gpu_init_mem_type':
> drivers/gpu/drm/virtio/virtgpu_ttm.c:117:28: warning:
>   variable 'vgdev' set but not used [-Wunused-but-set-variable]
>
> drivers/gpu/drm/virtio/virtgpu_ttm.c: In function 'virtio_gpu_bo_swap_notify':
> drivers/gpu/drm/virtio/virtgpu_ttm.c:300:28: warning:
>   variable 'vgdev' set but not used [-Wunused-but-set-variable]
>
> It is never used since introduction in dc5698e80cf7 ("Add virtio gpu driver.")
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>


Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

-Mukesh

> ---
> v2: fix patch prefix
> ---
>   drivers/gpu/drm/virtio/virtgpu_ttm.c | 6 ------
>   1 file changed, 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_ttm.c b/drivers/gpu/drm/virtio/virtgpu_ttm.c
> index d6225ba20b30..eb007c2569d8 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_ttm.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_ttm.c
> @@ -114,10 +114,6 @@ static const struct ttm_mem_type_manager_func virtio_gpu_bo_manager_func = {
>   static int virtio_gpu_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
>   				    struct ttm_mem_type_manager *man)
>   {
> -	struct virtio_gpu_device *vgdev;
> -
> -	vgdev = virtio_gpu_get_vgdev(bdev);
> -
>   	switch (type) {
>   	case TTM_PL_SYSTEM:
>   		/* System memory */
> @@ -297,10 +293,8 @@ static void virtio_gpu_bo_move_notify(struct ttm_buffer_object *tbo,
>   static void virtio_gpu_bo_swap_notify(struct ttm_buffer_object *tbo)
>   {
>   	struct virtio_gpu_object *bo;
> -	struct virtio_gpu_device *vgdev;
>   
>   	bo = container_of(tbo, struct virtio_gpu_object, tbo);
> -	vgdev = (struct virtio_gpu_device *)bo->gem_base.dev->dev_private;
>   
>   	if (bo->pages)
>   		virtio_gpu_object_free_sg_table(bo);
>
>
>
