From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 28 Oct 2019 18:00:48 +0000
Subject: Re: drm/tinydrm: Fix memory leak in hx8357d_probe
Message-Id: <4deb2230-eabe-b817-8516-3dfad68d2065@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191027173234.6449-1-navid.emamdoost@gmail.com>
 <85cb5ed9-66ba-3461-dd56-017b89ba70ce@web.de>
In-Reply-To: <85cb5ed9-66ba-3461-dd56-017b89ba70ce@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> …
>> +free_dbidev:
>> +	kfree(dbidev);
> …
>
> I became curious if there is a need for such a memory release at another place.

I have taken another look also at a related implementation detail.
Now I have realised that the desired clean-up should usually be achieved by
the callback function “mipi_dbi_release” for this software module.
https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/gpu/drm/drm_mipi_dbi.c#L581
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/drm_mipi_dbi.c?id=0365fb6baeb1ebefbbdad9e3f48bab9b3ccb8df3#n581

Regards,
Markus
