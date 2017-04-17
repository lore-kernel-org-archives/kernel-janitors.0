From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon, 17 Apr 2017 08:25:58 +0000
Subject: Re: pinctrl: imx: Checking reuse of grouping functionality
Message-Id: <CAAMH-ysVX+ZX-+nEF2kyrAKqhrkaZisBKiZuv6fAZUrKk3-ZDg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <60eb8e84-7914-4e25-4822-7e1d8fd8afcb@users.sourceforge.net>
In-Reply-To: <60eb8e84-7914-4e25-4822-7e1d8fd8afcb@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-gpio@vger.kernel.org, Alexander Shiyan <shc_work@mail.ru>, Fabio Estevam <fabio.estevam@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Peng Fan <van.freenix@gmail.com>, Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Markus, All,

On Sat, Apr 15, 2017 at 9:55 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> Hello,
>
> A preprocessor symbol like “CONFIG_GENERIC_PINCTRL_GROUPS” was introduced
> by the commit c033a718f615b6b3ddc83ce3e0a217c30bd09cb5 (“pinctrl: stricten up
> generic group code”) on 2017-01-03. Some functions are only available then
> when this macro is defined.

Yes because the pinctrl driver can be used without this configuration
by some drivers.

> I have got the impression that the corresponding programming interface is used
> by the source file “drivers/pinctrl/freescale/pinctrl-imx.c” unconditionally.
> How do you think about to extend specifications for conditional compilation there?

However the imx pinctrl driver _absolutely_ needs this configuration
to work. That is why it is selected automatically when the driver is
enabled [1].

Therefore it isn't possible to build the driver without
GENERIC_PINCTRL_GROUPS and so adding conditions is not necessary.

Regards,
Gary

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pinctrl/freescale/Kconfig#n3
