From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Aug 2018 10:55:34 +0000
Subject: Re: [PATCH] drm/pl111: add in missing sentinel to a of_device_id array
Message-Id: <CACRpkdZDpfPDOgXy8+58qSmMu=bMsMrtruoDeLzPe+t1eYpqCA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180821105407.2318-1-colin.king@canonical.com>
In-Reply-To: <20180821105407.2318-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Eric Anholt <eric@anholt.net>, Dave Airlie <airlied@linux.ie>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Aug 21, 2018 at 12:54 PM Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Array vexpress_muxfpga_match is missing an end of array sentinel,
> add it.
>
> Detected by Coccinelle: ("vexpress_muxfpga_match is not NULL
> terminated at line")
>
> Fixes: ca454bd42dc2 ("drm/pl111: Support the Versatile Express")
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
