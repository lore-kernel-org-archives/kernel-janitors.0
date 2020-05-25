From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 May 2020 09:18:51 +0000
Subject: Re: [PATCH] bus: arm-integrator-lm: Fix an IS_ERR() vs NULL check
Message-Id: <CACRpkda90y7p=5iBS0=WyYxDVRhMwdVUMWO3E5uvdwES=UZNrA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200520120804.GI172354@mwanda>
In-Reply-To: <20200520120804.GI172354@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

Hi Dan,

On Wed, May 20, 2020 at 2:08 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The of_find_matching_node() function returns NULL on error, it never
> returns error pointers.  This doesn't really impact runtime very much
> because if "syscon" is NULL then syscon_node_to_regmap() will return
> -EINVAL.  The only runtime difference is that now it returns -ENODEV.
>
> Fixes: ccea5e8a5918 ("bus: Add driver for Integrator/AP logic modules")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> The first patch which added this file doesn't give a good hint what the
> subsystem prefix should be so I just guessed "bus: arm-integrator-lm:".

I got a similar patch from Wei that I forwarded to the ARM SoC
maintainers that usually apply the bus patches for me.

Thanks anyway!

Yours,
Linus Walleij
