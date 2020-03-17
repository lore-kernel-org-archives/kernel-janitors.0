From: Doug Anderson <dianders@chromium.org>
Date: Tue, 17 Mar 2020 17:26:55 +0000
Subject: Re: [PATCH] drm/msm: Fix an error handling path 'msm_drm_init()'
Message-Id: <CAD=FV=WrncW_y+dtXHU7Lj1J0Lh7w8Kw+d28KZF52-OMs=0pSQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200315194239.28785-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200315194239.28785-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: freedreno <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>

Hi,

On Sun, Mar 15, 2020 at 12:42 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> If this memory allocation fails, we have to go through the error handling
> path to perform some clean-up, as already done in other other paths of
> this function.
>
> Fixes: db735fc4036b ("drm/msm: Set dma maximum segment size for mdss")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

This has already been posted as:

https://lore.kernel.org/r/20200309101410.GA18031@duo.ucw.cz
