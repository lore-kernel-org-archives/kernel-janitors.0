From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Date: Tue, 27 Aug 2019 09:54:59 +0000
Subject: RE: [PATCH] pinctrl: sh-pfc: Unlock on error in sh_pfc_func_set_mux()
Message-Id: <TYAPR01MB454438EC8C4F01FB5F0B24F0D8A00@TYAPR01MB4544.jpnprd01.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190827093927.GB8443@mwanda>
In-Reply-To: <20190827093927.GB8443@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Dan,

> From: Dan Carpenter, Sent: Tuesday, August 27, 2019 6:39 PM
> 
> We need to unlock and enable IRQs before we return on this error path.
> 
> Fixes: 8a0cc47ccc7c ("pinctrl: sh-pfc: Rollback to mux if required when the gpio is freed")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda
