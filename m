From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Jun 2019 09:58:01 +0000
Subject: Re: [PATCH] drm/mcde: Fix an uninitialized variable
Message-Id: <CACRpkdZj=TPB_mDib6sQnDPLUJUtwhmrFqWSwcRMozJYFeuAaw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190529113458.GG19119@mwanda>
In-Reply-To: <20190529113458.GG19119@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>

On Wed, May 29, 2019 at 4:25 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We never set "vblank" to "false".
>
> Current versions of GCC will initialize it to zero automatically at
> certain optimization levels so that's probably why this didn't show up
> in testing.
>
> Fixes: 5fc537bfd000 ("drm/mcde: Add new driver for ST-Ericsson MCDE")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.

Yours,
Linus Walleij
