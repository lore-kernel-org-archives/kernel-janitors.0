From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2020 17:05:25 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust to renaming physmap_of_versatile.c
Message-Id: <CACRpkdabUZYhr7S8fcOX-dOgUEfDTnhUZjqsadyghpuTDCoqpw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200228063338.4099-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200228063338.4099-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Boris Brezillon <boris.brezillon@bootlin.com>, Joe Perches <joe@perches.com>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Sebastian Duda <sebastian.duda@fau.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>

On Fri, Feb 28, 2020 at 7:33 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

> Commit 6ca15cfa0788 ("mtd: maps: Rename physmap_of_{versatile, gemini}
> into physmap-{versatile, gemini}") renamed physmap_of_versatile.c to
> physmap-versatile.c, but did not adjust the MAINTAINERS entry.
>
> Since then, ./scripts/get_maintainer.pl --self-test complains:
>
>   warning: no file matches F: drivers/mtd/maps/physmap_of_versatile.c
>
> Rectify the ARM INTEGRATOR, VERSATILE AND REALVIEW SUPPORT entry and now
> also cover drivers/mtd/maps/physmap-versatile.h while at it.
>
> Co-developed-by: Sebastian Duda <sebastian.duda@fau.de>
> Signed-off-by: Sebastian Duda <sebastian.duda@fau.de>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
