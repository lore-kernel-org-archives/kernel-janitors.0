From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 31 May 2020 12:14:05 +0000
Subject: Re: drm/nouveau/clk/gm20b: Fix memory leaks after failed gk20a_clk_ctor() calls
Message-Id: <f02d4f00-965a-12d0-d306-a943e2551184@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dd729c13-fbc8-22e7-7d8e-e3e126f66943@web.de>
 <40d8fb01.db721.17269d3d620.Coremail.dinghao.liu@zju.edu.cn>
 <74977dc6-7ace-6ef7-4fcd-3f6c89a3eb5f@web.de>
 <286858ff.db7e3.17269ee5f3f.Coremail.dinghao.liu@zju.edu.cn>
 <5a073b2b-5102-adec-84dd-b62dc48c7451@web.de>
 <1c5b64dc.db888.1726a03b710.Coremail.dinghao.liu@zju.edu.cn>
 <d05224e4-d682-de3e-928f-5af7b8597a8d@web.de>
 <599cd7d4.dbaba.1726a53da96.Coremail.dinghao.liu@zju.edu.cn>
In-Reply-To: <599cd7d4.dbaba.1726a53da96.Coremail.dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Kangjie Lu <kjlu@umn.edu>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>

> In this case, maybe we should check the return value of
> gk20a_clk_ctor() and release clk if it returns -ENOMEM.

All error situations (including failed memory allocations) can matter here.


> And many other functions also have the same issue
> (e.g. gm20b_clk_new_speedo0).

I recommend to increase the error detection and improve the desired
exception handling accordingly.

Regards,
Markus
