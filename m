From: Gerd Hoffmann <kraxel@redhat.com>
Date: Thu, 21 Feb 2019 12:05:45 +0000
Subject: Re: [PATCH -next] drm/qxl: remove set but not used variable 'bo_old'
Message-Id: <20190221120545.dnllvgdszdk4yf5z@sirius.home.kraxel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190218085459.196470-1-yuehaibing@huawei.com>
In-Reply-To: <20190218085459.196470-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, virtualization@lists.linux-foundation.org, spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Feb 18, 2019 at 08:54:59AM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/gpu/drm/qxl/qxl_display.c: In function 'qxl_primary_atomic_update':
> drivers/gpu/drm/qxl/qxl_display.c:538:17: warning:
>  variable 'bo_old' set but not used [-Wunused-but-set-variable]
> 
> It's not used any more after 4979904c62b9 ("drm/qxl: use shadow bo directly")

Pushed to drm-misc-next.

thanks,
  Gerd
