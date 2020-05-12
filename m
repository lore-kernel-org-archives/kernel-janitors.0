From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 12 May 2020 13:01:24 +0000
Subject: Re: [PATCH -next] drm/mcde: dsi: Fix return value check in dev_err()
Message-Id: <CACvgo51t+LdpRuFw-uXgbstpHMRrgMt3s62mFsyO37OHjuWJNw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200428141459.87624-1-weiyongjun1@huawei.com>
 <CACRpkdZ++vYw8LAiNUv6AXQ0QTh+W9vSL0_w2AR-GNNd=GH7FA@mail.gmail.com>
In-Reply-To: <CACRpkdZ++vYw8LAiNUv6AXQ0QTh+W9vSL0_w2AR-GNNd=GH7FA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>

Hi all,

On Tue, 12 May 2020 at 12:49, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Apr 28, 2020 at 4:13 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> > In case of error, the function of_drm_find_bridge() returns NULL pointer
> > not ERR_PTR(). The IS_ERR() test in the return value check should be
> > replaced with NULL test.
> >
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
>
> Patch applied! Thanks Wei, sorry for the long delay.
>
It would be nice if of_drm_find_bridge and of_drm_find_panel were
consistent - either return NULL or an ERR_PTR.
Otherwise the next person using them is likely to get it wrong.

-Emil
