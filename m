From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Sep 2018 12:17:48 +0000
Subject: Re: [PATCH] pinctrl: at91-pio4: fix has_config check in atmel_pctl_dt_subnode_to_map()
Message-Id: <CACRpkdY2OyNr2QcwJqx8P-wYo_6_s5Ya8VC+5eHsyvs2WJ9wog@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180910083745.2laxr4upjq36cyqf@kili.mountain>
In-Reply-To: <20180910083745.2laxr4upjq36cyqf@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Sep 10, 2018 at 10:37 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> Smatch complains about this condition:
>
>         if (has_config && num_pins >= 1)
>
> The "has_config" variable is either uninitialized or true.  The
> "num_pins" variable is unsigned and we verified that it is non-zero on
> the lines before so we know "num_pines >= 1" is true.  Really, we could
> just check "num_configs" directly and remove the "has_config" variable.
>
> Fixes: 776180848b57 ("pinctrl: introduce driver for Atmel PIO4 controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied with Ludovic's ACK.

Yours,
Linus Walleij
