From: Julia Lawall <julia.lawall@inria.fr>
Date: Sat, 20 Jun 2020 13:21:43 +0000
Subject: Re: [PATCH v3] drm/amd: Fix memory leak according to error branch
Message-Id: <alpine.DEB.2.22.394.2006201520590.2918@hadrien>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="8323329-1522092164-1592659303=:2918"
List-Id: <kernel-janitors.vger.kernel.org>
References: <119b7d8c-b164-ef23-84cc-4904d34ac023@web.de>
In-Reply-To: <119b7d8c-b164-ef23-84cc-4904d34ac023@web.de>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: opensource.kernel@vivo.com, David Airlie <airlied@linux.ie>, Bernard Zhao <bernard@vivo.com>, =?ISO-8859-15?Q?Felix_K=FChling?= <Felix.Kuehling@amd.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1522092164-1592659303=:2918
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit



On Sat, 20 Jun 2020, Markus Elfring wrote:

> > The function kobject_init_and_add alloc memory like:
> > kobject_init_and_add->kobject_add_varg->kobject_set_name_vargs
> > ->kvasprintf_const->kstrdup_const->kstrdup->kmalloc_track_caller
> > ->kmalloc_slab, in err branch this memory not free. If use
> > kmemleak, this path maybe catched.
> > These changes are to add kobject_put in kobject_init_and_add
> > failed branch, fix potential memleak.
> …
> > Changes since V2:
> > *remove duplicate kobject_put in kfd_procfs_init.
>
> Under which circumstances are going to improve this change description accordingly?

Bernard, please update the log message as well.  The mail you sent was
much more clear, but mail just gets lost over time.  The log message
itself should be improved.

julia

>
> Would you like to add the tag “Fixes” to the commit message?
>
> Regards,
> Markus
>
--8323329-1522092164-1592659303=:2918--
