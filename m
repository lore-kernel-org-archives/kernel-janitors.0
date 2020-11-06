From: Gerd Hoffmann <kraxel@redhat.com>
Date: Fri, 06 Nov 2020 08:25:05 +0000
Subject: Re: [PATCH] drm/virtio: Fix a double free in virtio_gpu_cmd_map()
Message-Id: <20201106082505.oieppl6xpc3cng7q@sirius.home.kraxel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201030114808.GD3251003@mwanda>
In-Reply-To: <20201030114808.GD3251003@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, Gurchetan Singh <gurchetansingh@chromium.org>

On Fri, Oct 30, 2020 at 02:48:08PM +0300, Dan Carpenter wrote:
> This is freed both here and in the caller (virtio_gpu_vram_map()) so
> it's a double free.  The correct place is only in the caller.
> 
> Fixes: 16845c5d5409 ("drm/virtio: implement blob resources: implement vram object")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pushed to drm-misc-next.

thanks,
  Gerd
