From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 31 May 2020 09:00:17 +0000
Subject: Re: drm/nouveau/clk/gm20b: Fix memory leak in gm20b_clk_new()
Message-Id: <5a073b2b-5102-adec-84dd-b62dc48c7451@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dd729c13-fbc8-22e7-7d8e-e3e126f66943@web.de>
 <40d8fb01.db721.17269d3d620.Coremail.dinghao.liu@zju.edu.cn>
 <74977dc6-7ace-6ef7-4fcd-3f6c89a3eb5f@web.de>
 <286858ff.db7e3.17269ee5f3f.Coremail.dinghao.liu@zju.edu.cn>
In-Reply-To: <286858ff.db7e3.17269ee5f3f.Coremail.dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Kangjie Lu <kjlu@umn.edu>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>

> I just found that clk is referenced by pclk in this function. When clk is freed,
> pclk will be allocated in gm20b_clk_new_speedo0(). Thus we should not release clk
> in this function and there is no bug here.

Can there be a need to release a clock object after a failed gk20a_clk_ctor() call?

Regards,
Markus
