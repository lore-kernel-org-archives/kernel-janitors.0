From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 30 Sep 2017 23:32:04 +0000
Subject: Re: [PATCH] drm: of: always initialize panel in drm_of_find_panel_or_bridge()
Message-Id: <CACRpkdZ1oaZiDJt==ZR-ZCy9HMC5wHR1tse37Xjv+zFzwYyvQQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170925103038.lvr5msjvekwczctn@mwanda>
In-Reply-To: <20170925103038.lvr5msjvekwczctn@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, Sean Paul <seanpaul@chromium.org>, David Airlie <airlied@linux.ie>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Sep 25, 2017 at 12:30 PM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:

> The callers expect "panel" to be initialized, but that isn't true if we
> return -ENODEV.  It causes bugs like:
>
>     drivers/gpu/drm/tve200/tve200_drv.c:83 tve200_modeset_init()
>     error: uninitialized symbol 'panel'.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.

Yours,
Linus Walleij
