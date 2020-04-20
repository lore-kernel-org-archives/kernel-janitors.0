From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Apr 2020 06:36:47 +0000
Subject: Re: [PATCH RESEND] MAINTAINERS: adjust to renaming physmap_of_versatile.c
Message-Id: <CACRpkda7DBqJ_3N7eyqBREFk1jQpRQokgOqLq-sGs9UpaaSfXg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200418100933.8012-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200418100933.8012-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Joe Perches <joe@perches.com>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Sebastian Duda <sebastian.duda@fau.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>

On Sat, Apr 18, 2020 at 12:10 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:

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
> ---
> Boris, please pick or ack this patch.
> applies cleanly on current master and next-20200417

Patch applied to my Versatile tree.

Will send a pull request for this to ARM SoC soon.

Yours,
Linus Walleij
