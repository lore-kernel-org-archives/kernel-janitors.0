From: Gerd Hoffmann <kraxel@redhat.com>
Date: Wed, 14 Nov 2018 12:16:02 +0000
Subject: Re: [PATCH -next] drm/qxl: remove set but not used variable 'map'
Message-Id: <20181114121602.wb4gesmvhknvy4cc@sirius.home.kraxel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1541821486-40631-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1541821486-40631-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>, virtualization@lists.linux-foundation.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Nov 10, 2018 at 03:44:46AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/gpu/drm/qxl/qxl_object.c: In function 'qxl_bo_kunmap_atomic_page':
> drivers/gpu/drm/qxl/qxl_object.c:189:21: warning:
>  variable 'map' set but not used [-Wunused-but-set-variable]

Both qxl patches added to qemu queue, should land in drm-misc-next soon.

thanks,
  Gerd
