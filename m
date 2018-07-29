From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 29 Jul 2018 21:23:36 +0000
Subject: Re: [PATCH] pinctrl: imx: off by one in imx_pinconf_group_dbg_show()
Message-Id: <CACRpkdZPXCbXCg=yGi=hbT1gGKTmUM6WJd=Zjt8T_kbmZd8mvQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180719081648.o6ug4z3t42mrsmop@mwanda>
In-Reply-To: <20180719081648.o6ug4z3t42mrsmop@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Jul 19, 2018 at 10:17 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The > should really be >= here.  It's harmless because
> pinctrl_generic_get_group() will return a NULL if group is invalid.
>
> Fixes: ae75ff814538 ("pinctrl: pinctrl-imx: add imx pinctrl core driver")
> Reported-by: Dong Aisheng <aisheng.dong@nxp.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied.

Yours,
Linus Walleij
