From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 May 2020 12:04:45 +0000
Subject: Re: [PATCH -next v2] drm/mcde: dsi: Fix return value check in mcde_dsi_bind()
Message-Id: <CACRpkda2-EHn3BrMtGoTV4uax6G0JJekEjnnLL1FT+2YQFawTQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200428141459.87624-1-weiyongjun1@huawei.com>
 <20200430073145.52321-1-weiyongjun1@huawei.com>
In-Reply-To: <20200430073145.52321-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Apr 30, 2020 at 9:30 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:

> The of_drm_find_bridge() function returns NULL on error, it doesn't return
> error pointers so this check doesn't work.
>
> Fixes: 5fc537bfd000 ("drm/mcde: Add new driver for ST-Ericsson MCDE")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
> v1 - > v2: add fixes and fix the subject

Already applied v1, no big deal anyways, its a nonurgent fix.

Yours,
Linus Walleij
