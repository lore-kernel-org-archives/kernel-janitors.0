From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 May 2020 11:49:05 +0000
Subject: Re: [PATCH -next] drm/mcde: dsi: Fix return value check in dev_err()
Message-Id: <CACRpkdZ++vYw8LAiNUv6AXQ0QTh+W9vSL0_w2AR-GNNd=GH7FA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200428141459.87624-1-weiyongjun1@huawei.com>
In-Reply-To: <20200428141459.87624-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Apr 28, 2020 at 4:13 PM Wei Yongjun <weiyongjun1@huawei.com> wrote:

> In case of error, the function of_drm_find_bridge() returns NULL pointer
> not ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Patch applied! Thanks Wei, sorry for the long delay.

Yours,
Linus Walleij
