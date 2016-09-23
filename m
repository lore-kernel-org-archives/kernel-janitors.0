From: =?UTF-8?Q?Christian_K=c3=b6nig?= <deathsimple@vodafone.de>
Date: Fri, 23 Sep 2016 09:44:54 +0000
Subject: Re: [PATCH 00/14] GPU-DRM-TTM: Fine-tuning for several function implementations
Message-Id: <f079ffc1-042c-0332-98e1-5acc6589e4b6@vodafone.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <4d34446f-05ad-c3ce-5d33-8fb4f25af25c@users.sourceforge.net>
In-Reply-To: <4d34446f-05ad-c3ce-5d33-8fb4f25af25c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

First of all please stop sending your patches as a reply to an earlier 
and completely unrelated series.

Second please prefix all TTM related patches with "drm/ttm:".

Additional to that I don't really see the point in renaming some of the 
jump labels, if you call it "restart" or "lock_restart" doesn't make 
much difference.

Regards,
Christian.

Am 22.09.2016 um 19:32 schrieb SF Markus Elfring:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 22 Sep 2016 19:00:01 +0200
>
> Several update suggestions were taken into account
> from static source code analysis.
>
> Markus Elfring (14):
>    Use kmalloc_array() in two functions
>    Rename a jump label in ttm_alloc_new_pages()
>    Rename jump labels in ttm_page_pool_free()
>    Rename a jump label in ttm_page_pool_get_pages()
>    Use kmalloc_array() in two more functions
>    Rename a jump label in ttm_dma_pool_alloc_new_pages()
>    Rename jump labels in ttm_dma_page_pool_free()
>    Rename a jump label in ttm_dma_pool_shrink_scan()
>    Return directly after a failed kzalloc() in ttm_dma_page_alloc_init()
>    Return directly after a failed kobject_init_and_add() in ttm_dma_page_alloc_init()
>    Return an error code only as a constant in ttm_dma_pool_init()
>    Less function calls in ttm_dma_pool_init() after error detection
>    Delete unnecessary variable initialisations in ttm_dma_pool_init()
>    Mark an array of text strings as "const" in ttm_dma_pool_init()
>
>   drivers/gpu/drm/ttm/ttm_page_alloc.c     | 30 ++++++++---------
>   drivers/gpu/drm/ttm/ttm_page_alloc_dma.c | 58 +++++++++++++++-----------------
>   2 files changed, 42 insertions(+), 46 deletions(-)
>

