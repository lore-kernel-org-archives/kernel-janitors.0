From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 17 Apr 2017 16:08:24 +0000
Subject: Re: pinctrl: imx: Checking reuse of grouping functionality
Message-Id: <2c82f25b-4095-fbb0-f766-c83387b46ef5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <60eb8e84-7914-4e25-4822-7e1d8fd8afcb@users.sourceforge.net>
 <CAAMH-ysVX+ZX-+nEF2kyrAKqhrkaZisBKiZuv6fAZUrKk3-ZDg@mail.gmail.com>
In-Reply-To: <CAAMH-ysVX+ZX-+nEF2kyrAKqhrkaZisBKiZuv6fAZUrKk3-ZDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Gary Bisson <gary.bisson@boundarydevices.com>
Cc: linux-gpio@vger.kernel.org, Alexander Shiyan <shc_work@mail.ru>, Fabio Estevam <fabio.estevam@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Peng Fan <van.freenix@gmail.com>, Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> However the imx pinctrl driver _absolutely_ needs this configuration to work.

Thanks for your explanation that the file “drivers/pinctrl/freescale/Kconfig”
will usually provide needed information for this software module.

Would it make sense to document such a requirement also by a preprocessor error
directive in the source file “drivers/pinctrl/freescale/pinctrl-imx.c”
for the special case if the macro “CONFIG_GENERIC_PINCTRL_GROUPS” would
accidentally not be defined?

Regards,
Markus
