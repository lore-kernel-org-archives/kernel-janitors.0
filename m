From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 26 Aug 2019 20:07:42 +0000
Subject: Re: [PATCH] drm/mcde: Fix an error handling path in 'mcde_probe()'
Message-Id: <CACRpkdb0CuPVby066zjqLX1rRuc6KDL7jvt3KaCpEWgEFvp+Mg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190822211518.5578-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190822211518.5578-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Aug 22, 2019 at 11:15 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:

> If we don't find any matching components, we should go through the error
> handling path, in order to free some resources.
>
> Fixes: ca5be902a87d ("drm/mcde: Fix uninitialized variable")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch applied!

Yours,
Linus Walleij
