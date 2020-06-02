From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Jun 2020 10:29:55 +0000
Subject: Re: Re: [PATCH] drm/nouveau/clk/gm20b: Fix memory leak in gm20b_clk_new()
Message-Id: <20200602102955.GZ30374@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dd729c13-fbc8-22e7-7d8e-e3e126f66943@web.de>
 <40d8fb01.db721.17269d3d620.Coremail.dinghao.liu@zju.edu.cn>
In-Reply-To: <40d8fb01.db721.17269d3d620.Coremail.dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dinghao.liu@zju.edu.cn
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Markus Elfring <Markus.Elfring@web.de>, Ben Skeggs <bskeggs@redhat.com>, Kangjie Lu <kjlu@umn.edu>

The original patch was basically fine.  Just add a Fixes tag and resend.

regards,
dan carpenter
