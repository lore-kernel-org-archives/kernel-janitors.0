From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 31 May 2020 08:03:19 +0000
Subject: Re: [PATCH] drm/nouveau/clk/gm20b: Fix memory leak in gm20b_clk_new()
Message-Id: <dd729c13-fbc8-22e7-7d8e-e3e126f66943@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Kangjie Lu <kjlu@umn.edu>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>

> When gk20a_clk_ctor() returns an error code, pointer "clk"
> should be released.

Such an information is reasonable.


> It's the same when gm20b_clk_new() returns from elsewhere following this call.

I suggest to reconsider the interpretation of the software situation once more.
Can it be that the allocated clock object should be kept usable even after
a successful return from this function?


Would you like to add the tag “Fixes” to the commit message?

Regards,
Markus
