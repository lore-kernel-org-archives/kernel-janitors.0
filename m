From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 31 May 2020 08:38:03 +0000
Subject: Re: drm/nouveau/clk/gm20b: Fix memory leak in gm20b_clk_new()
Message-Id: <74977dc6-7ace-6ef7-4fcd-3f6c89a3eb5f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dd729c13-fbc8-22e7-7d8e-e3e126f66943@web.de>
 <40d8fb01.db721.17269d3d620.Coremail.dinghao.liu@zju.edu.cn>
In-Reply-To: <40d8fb01.db721.17269d3d620.Coremail.dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Kangjie Lu <kjlu@umn.edu>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>

> It's possible that we expect an usable clk pointer, though I could not find
> the exact usage yet.

I am curious if another developer would like to add helpful background information.


> For security, I will release this pointer only on error paths in this function.

Do you tend to release objects (which are referenced by pointers)?

Regards,
Markus
