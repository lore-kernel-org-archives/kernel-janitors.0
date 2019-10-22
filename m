From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 22 Oct 2019 07:30:34 +0000
Subject: Re: [PATCH] drm/v3d: Fix memory leak in v3d_submit_cl_ioctl
Message-Id: <f5c228b6-eb9b-445d-3055-bb966e1c5deb@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191021185250.26130-1-navid.emamdoost@gmail.com>
 <a28f12a8-49c4-30f0-cc86-6a41ded96ab2@web.de>
In-Reply-To: <a28f12a8-49c4-30f0-cc86-6a41ded96ab2@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Navid Emamdoost <navid.emamdoost@gmail.com>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>, Iago Toral Quiroga <itoral@igalia.com>

> …
>> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
>> @@ -557,13 +557,16 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
> …
>>  		if (ret) {
>>  			v3d_job_put(&render->base);
>> +			kfree(bin);
> …
>
> Can it be helpful to move the added function call before the other
> in this if branch (if you prefer to avoid the addition of a jump target here)?

I got into the mood to take another look at these implementation details.
I suggest then to look at the commit 0d352a3a8a1f26168d09f7073e61bb4b328e3bb9
("drm/v3d: don't leak bin job if v3d_job_init fails." from 2019-09-18)
once more.

With which software versions did you perform your source code analysis?

Regards,
Markus
