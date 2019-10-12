From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 12 Oct 2019 18:04:57 +0000
Subject: pinctrl: lantiq: Checking two kmemdup() calls in ltq_pinctrl_dt_subnode_to_map()
Message-Id: <e0284a24-08f9-01da-98d9-366a45c3c8ff@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>

Hello,

I tried another script for the semantic patch language out.
This source code analysis approach points out that the implementation
of the function “ltq_pinctrl_dt_subnode_to_map” contains still
two unchecked calls of the function “kmemdup”.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pinctrl/pinctrl-lantiq.c?id=1c0cc5f1ae5ee5a6913704c0d75a6e99604ee30a#n116
https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/gpu/drm/nouveau/nouveau_connector.c#L476

How do you think about to improve it?

Regards,
Markus
