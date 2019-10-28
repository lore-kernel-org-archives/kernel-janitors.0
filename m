From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 28 Oct 2019 17:00:04 +0000
Subject: drm/mcde: Reconsider duplicate statement in mcde_probe()
Message-Id: <9332a4c9-66c3-b57b-036b-a20b0e821334@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Linus Walleij <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, David Airlie <airlied@linux.ie>

Hello,

I have taken another look also at the implementation of the function “mcde_probe”.
Now I wonder why the statement “drm->dev_private = mcde;” was specified twice there.
https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/gpu/drm/mcde/mcde_drv.c#L339
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/mcde/mcde_drv.c?id=0365fb6baeb1ebefbbdad9e3f48bab9b3ccb8df3#n339

How do you think about to delete one of them so that a duplicate assignment
can be avoided?

Regards,
Markus
