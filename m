From: Gerd Hoffmann <kraxel@redhat.com>
Date: Thu, 28 Mar 2019 10:32:09 +0000
Subject: Re: [PATCH v2 -next] drm/virtio: remove set but not used variable 'vgdev'
Message-Id: <20190328103209.wmdakmzmiwaxf7cx@sirius.home.kraxel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190320020308.12745-1-yuehaibing@huawei.com>
 <20190325092631.152060-1-yuehaibing@huawei.com>
In-Reply-To: <20190325092631.152060-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Mar 25, 2019 at 09:26:31AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/gpu/drm/virtio/virtgpu_ttm.c: In function 'virtio_gpu_init_mem_type':
> drivers/gpu/drm/virtio/virtgpu_ttm.c:117:28: warning:
>  variable 'vgdev' set but not used [-Wunused-but-set-variable]
> 
> drivers/gpu/drm/virtio/virtgpu_ttm.c: In function 'virtio_gpu_bo_swap_notify':
> drivers/gpu/drm/virtio/virtgpu_ttm.c:300:28: warning:
>  variable 'vgdev' set but not used [-Wunused-but-set-variable]
> 
> It is never used since introduction in dc5698e80cf7 ("Add virtio gpu driver.")

Patch queued up.

thanks,
  Gerd
