From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 21 Oct 2019 20:40:22 +0000
Subject: Re: [PATCH] drm/v3d: Fix memory leak in v3d_submit_cl_ioctl
Message-Id: <a28f12a8-49c4-30f0-cc86-6a41ded96ab2@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191021185250.26130-1-navid.emamdoost@gmail.com>
In-Reply-To: <20191021185250.26130-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>

> In the impelementation of v3d_submit_cl_ioctl() there are two memory leaks.

Please avoid another typo also in this change description.


> … If kcalloc fails to allocate memory for bin then
> render->base should be put. Also, if v3d_job_init() fails to initialize
> bin->base then allocated memory for bin should be released.

Will an “imperative mood” be more appropriate for such wordings?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=7d194c2100ad2a6dded545887d02754948ca5241#n151


…
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -557,13 +557,16 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
…
>  		if (ret) {
>  			v3d_job_put(&render->base);
> +			kfree(bin);
…

Can it be helpful to move the added function call before the other
in this if branch (if you prefer to avoid the addition of a jump target here)?

Regards,
Markus
