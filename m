From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 Sep 2017 15:33:46 +0000
Subject: Re: [PATCH] drm/tve200: Check for IS_ERR instead of NULL in probe
Message-Id: <CACRpkdZwC2Uzrtb=GJPDhC_5p0bs=BEV-S=OfCu=HQrrO_twQg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170925102520.a7spymwqqbsczzz2@mwanda>
In-Reply-To: <20170925102520.a7spymwqqbsczzz2@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, kernel-janitors@vger.kernel.org

On Mon, Sep 25, 2017 at 12:25 PM, Dan Carpenter
<dan.carpenter@oracle.com> wrote:

> devm_ioremap_resource() returns error pointer, it never returns NULL on
> error.
>
> Fixes: 179c02fe90a4 ("drm/tve200: Add new driver for TVE200")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I am travelling right now but will apply the patch on monday in
one week from now.

Yours,
Linus Walleij
