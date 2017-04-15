From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 15 Apr 2017 19:55:19 +0000
Subject: pinctrl: imx: Checking reuse of grouping functionality
Message-Id: <60eb8e84-7914-4e25-4822-7e1d8fd8afcb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-gpio@vger.kernel.org, Alexander Shiyan <shc_work@mail.ru>, Fabio Estevam <fabio.estevam@nxp.com>, Gary Bisson <gary.bisson@boundarydevices.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Peng Fan <van.freenix@gmail.com>, Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hello,

A preprocessor symbol like “CONFIG_GENERIC_PINCTRL_GROUPS” was introduced
by the commit c033a718f615b6b3ddc83ce3e0a217c30bd09cb5 (“pinctrl: stricten up
generic group code”) on 2017-01-03. Some functions are only available then
when this macro is defined.

I have got the impression that the corresponding programming interface is used
by the source file “drivers/pinctrl/freescale/pinctrl-imx.c” unconditionally.
How do you think about to extend specifications for conditional compilation there?

Regards,
Markus
