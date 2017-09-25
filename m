From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 Sep 2017 15:44:34 +0000
Subject: Re: [PATCH][drm-next] drm/tve200: make two functions static
Message-Id: <CACRpkdaL=FuB5boVgM5ZiLB2w29+ufaOxU_W5-=v6KSPx1=XfA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170922160516.16283-1-colin.king@canonical.com>
In-Reply-To: <20170922160516.16283-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: David Airlie <airlied@linux.ie>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Sep 22, 2017 at 6:05 PM, Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> The functions tve200_display_disable and tve200_display_funcs are
> local to the source and do not need to be in global scope, so make
> them static.
>
> Cleans up sparse warnings:
> symbol 'tve200_display_disable' was not declared. Should it be static?
> symbol 'tve200_display_funcs' was not declared. Should it be static?
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I am travelling right now but will apply the patch on monday in
one week from now.

Yours,
Linus Walleij
