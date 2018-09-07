From: Gerd Hoffmann <kraxel@redhat.com>
Date: Fri, 07 Sep 2018 07:34:02 +0000
Subject: Re: [PATCH -next] drm/virtio: Remove set but not used variable 'bo'
Message-Id: <20180907073402.2h37cmvc4i5dz3uz@sirius.home.kraxel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536285837-150460-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536285837-150460-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org

On Fri, Sep 07, 2018 at 02:03:57AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/gpu/drm/virtio/virtgpu_display.c: In function 'virtio_gpu_framebuffer_init':
> drivers/gpu/drm/virtio/virtgpu_display.c:78:28: warning:
>  variable 'bo' set but not used [-Wunused-but-set-variable]
>   struct virtio_gpu_object *bo;
>                             ^

Patch queued.

thanks,
  Gerd
