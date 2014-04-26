From: Mateusz Guzik <mguzik@redhat.com>
Date: Sat, 26 Apr 2014 17:03:06 +0000
Subject: Re: [PATCH] drm: make variable named "refcount" atomic, like most refcounts in the kernel.
Message-Id: <20140426170305.GA17562@mguzik.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <248367.21250.bm@smtp144.mail.ir2.yahoo.com>
In-Reply-To: <248367.21250.bm@smtp144.mail.ir2.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lionel Debroux <lionel_debroux@yahoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Apr 26, 2014 at 06:06:15PM +0200, Lionel Debroux wrote:
> Based on PaX.
> 
> ---
> 
> From 7c712cadd97d43d03ff3d7ca04fd85bd8c6eb34a Mon Sep 17 00:00:00 2001
> From: Lionel Debroux <lionel_debroux@yahoo.fr>
> Date: Sat, 26 Apr 2014 15:53:55 +0200
> Subject: drm: make variable named "refcount" atomic, like most refcounts in
>  the kernel.
> 
> Extracted from the PaX patch.
> 
> 
[snip]
>  	mutex_lock(&item->mutex);
> -	BUG_ON(item->refcount = 0);
> +	BUG_ON(atomic_read(&item->refcount) = 0);
>  	BUG_ON(ref->object != item->object);
> -	if (--item->refcount = 0) {
> +	if (atomic_dec_and_test(&item->refcount)) {
>  		ref->release(ref);
>  		item->object = NULL;
>  	}

I believe this change is in grsecurity so that overflow detector can be
used, there is clearly no reason to use mere atomic ops.

It may be that kernel devs would accept a patch implementing generic
refcount manipulation primitives without atomicity guarantees, which
could be used in cases like this.

Then atomic and non-atomic versions could be used to detect overflows and
overputs at least in debug kernels.

-- 
Mateusz Guzik
