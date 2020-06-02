From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Jun 2020 15:39:00 +0000
Subject: Re: [PATCH] drm/nouveau/clk/gm20b: Fix memory leak in gm20b_clk_new()
Message-Id: <20200602153900.GW22511@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dd729c13-fbc8-22e7-7d8e-e3e126f66943@web.de>
 <40d8fb01.db721.17269d3d620.Coremail.dinghao.liu@zju.edu.cn>
 <20200602102955.GZ30374@kadam>
 <65e3d2b7-b0ad-f387-b8fe-d83ea816a0f6@web.de>
In-Reply-To: <65e3d2b7-b0ad-f387-b8fe-d83ea816a0f6@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, Dinghao Liu <dinghao.liu@zju.edu.cn>, Kangjie Lu <kjlu@umn.edu>

On Tue, Jun 02, 2020 at 01:10:34PM +0200, Markus Elfring wrote:
> > The original patch was basically fine.
> 
> I propose to reconsider the interpretation of the software situation once more.
> 
> * Should the allocated clock object be kept usable even after
>   a successful return from this function?

Heh.  You're right.  The patch is freeing "clk" on the success path so
that doesn't work.

regards,
dan carpenter
