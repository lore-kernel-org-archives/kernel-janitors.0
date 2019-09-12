From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 12 Sep 2019 12:01:03 +0000
Subject: Re: [PATCH] pinctrl: sh-pfc: Unlock on error in sh_pfc_func_set_mux()
Message-Id: <CACRpkdbG0bz40U8qFSvi6ds-8XiUSX+yj1uC4XynyAfJWfantA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190827093927.GB8443@mwanda>
In-Reply-To: <20190827093927.GB8443@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Aug 27, 2019 at 10:39 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We need to unlock and enable IRQs before we return on this error path.
>
> Fixes: 8a0cc47ccc7c ("pinctrl: sh-pfc: Rollback to mux if required when the gpio is freed")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied for v5.4 with the ACKs.

Yours,
Linus Walleij
