From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 20 Jun 2020 12:37:28 +0000
Subject: Re: [PATCH v3] drm/amd: Fix memory leak according to error branch
Message-Id: <119b7d8c-b164-ef23-84cc-4904d34ac023@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Bernard Zhao <bernard@vivo.com>, opensource.kernel@vivo.com, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, =?UTF-8?Q?Felix_K=c3=bchling?= <Felix.Kuehling@amd.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>

> The function kobject_init_and_add alloc memory like:
> kobject_init_and_add->kobject_add_varg->kobject_set_name_vargs
> ->kvasprintf_const->kstrdup_const->kstrdup->kmalloc_track_caller
> ->kmalloc_slab, in err branch this memory not free. If use
> kmemleak, this path maybe catched.
> These changes are to add kobject_put in kobject_init_and_add
> failed branch, fix potential memleak.
…
> Changes since V2:
> *remove duplicate kobject_put in kfd_procfs_init.

Under which circumstances are going to improve this change description accordingly?

Would you like to add the tag “Fixes” to the commit message?

Regards,
Markus
