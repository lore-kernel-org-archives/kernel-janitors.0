From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 22 Feb 2018 13:02:43 +0000
Subject: Re: [PATCH] pinctrl: ocelot: make function ocelot_pinctrl_probe static
Message-Id: <CACRpkdYf58BsULzazia1R7iXicuZjuThh_+sAx5x4=EHZW1zZg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180208142437.11217-1-colin.king@canonical.com>
In-Reply-To: <20180208142437.11217-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Feb 8, 2018 at 3:24 PM, Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> The function ocelot_pinctrl_probe is local to the source and does not
> need to be in global scope, so make it static.
>
> Cleans up sparse warning:
> drivers/pinctrl/pinctrl-ocelot.c:465:5: warning: symbol
> 'ocelot_pinctrl_probe' was not declared. Should it be static?
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.

Yours,
Linus Walleij
