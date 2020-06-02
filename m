From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 02 Jun 2020 11:10:34 +0000
Subject: Re: [PATCH] drm/nouveau/clk/gm20b: Fix memory leak in gm20b_clk_new()
Message-Id: <65e3d2b7-b0ad-f387-b8fe-d83ea816a0f6@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dd729c13-fbc8-22e7-7d8e-e3e126f66943@web.de>
 <40d8fb01.db721.17269d3d620.Coremail.dinghao.liu@zju.edu.cn>
 <20200602102955.GZ30374@kadam>
In-Reply-To: <20200602102955.GZ30374@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Dinghao Liu <dinghao.liu@zju.edu.cn>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Kangjie Lu <kjlu@umn.edu>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>

> The original patch was basically fine.

I propose to reconsider the interpretation of the software situation once more.

* Should the allocated clock object be kept usable even after
  a successful return from this function?

* How much do “destructor” calls matter here for (sub)devices?


> Just add a Fixes tag and resend.

This tag can help also.

Regards,
Markus
