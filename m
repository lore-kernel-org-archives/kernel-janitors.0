From: Matteo Croce <mcroce@redhat.com>
Date: Fri, 29 Mar 2019 02:05:00 +0000
Subject: Re: [PATCH -next] drm/omap: Use PTR_ERR_OR_ZERO in hdmi4_core_init()
Message-Id: <CAGnkfhxAtMWk5Go3F2fw3dtnV8-3BSs4YbDrAn6+N1vjMv+u3Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190329014136.20318-1-yuehaibing@huawei.com>
In-Reply-To: <20190329014136.20318-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Sean Paul <seanpaul@chromium.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Benoit Parrot <bparrot@ti.com>, dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Mar 29, 2019 at 2:30 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/hdmi4_core.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>

Acked-by: Matteo Croce <mcroce@redhat.com>

-- 
Matteo Croce
per aspera ad upstream
