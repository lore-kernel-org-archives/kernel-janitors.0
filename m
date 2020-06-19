From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 19 Jun 2020 12:15:32 +0000
Subject: Re: [PATCH] drm/amdkfd: Fix memory leaks according to error branches
Message-Id: <c966b91e-765f-c36c-2563-4e348fd1daf6@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Bernard Zhao <bernard@vivo.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: opensource.kernel@vivo.com, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Kangjie Lu <kjlu@umn.edu>, =?UTF-8?Q?Felix_K=c3=bchling?= <Felix.Kuehling@amd.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Navid Emamdoost <emamd001@umn.edu>, Qiushi Wu <wu000273@umn.edu>, Aditya Pakki <pakki001@umn.edu>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>

> The function kobject_init_and_add alloc memory like:
> kobject_init_and_add->kobject_add_varg->kobject_set_name_vargs
> ->kvasprintf_const->kstrdup_const->kstrdup->kmalloc_track_caller
> ->kmalloc_slab, in err branch this memory not free. If use
> kmemleak, this path maybe catched.
> These changes are to add kobject_put in kobject_init_and_add
> failed branch, fix potential memleak.

I suggest to improve this change description.

* Can an other wording variant be nicer?

* Will the tag “Fixes” become helpful?

Regards,
Markus
