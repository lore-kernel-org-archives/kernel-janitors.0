From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 30 Jul 2018 15:43:43 +0000
Subject: Re: [PATCH] pinctrl: freescale: off by one in imx1_pinconf_group_dbg_show()
Message-Id: <CACRpkdaBM1tvbL9k7ZepEgnSC00_iLOStyb9B2t2=DipVgEW_A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180713145514.r7ukvw23kcdwc3pv@kili.mountain>
In-Reply-To: <20180713145514.r7ukvw23kcdwc3pv@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jul 13, 2018 at 4:55 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The info->groups[] array is allocated in imx1_pinctrl_parse_dt().  It
> has info->ngroups elements.  Thus the > here should be >= to prevent
> reading one element beyond the end of the array.
>
> Fixes: 30612cd90005 ("pinctrl: imx1 core driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.

I am not tagging for stable as it is debug code and does not
affect end users.

Yours,
Linus Walleij
