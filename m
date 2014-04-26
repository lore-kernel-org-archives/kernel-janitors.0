From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Sat, 26 Apr 2014 16:35:37 +0000
Subject: Re: [PATCH] drm: make variable named "refcount" atomic, like most refcounts in the kernel.
Message-Id: <20140426163537.GF18016@ZenIV.linux.org.uk>
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

Lovely - cargo-cult at its finest.  "Most refcounts are atomic, must be
good medicine.  Shaman has spoken".

> -	int refcount;
> +	atomic_t refcount;

... therefore, all places that modify that sucker will have to be visible
in the patch.  And those are
  
> -	++item->refcount;
> +	atomic_inc(&item->refcount);
>  	ref->object = item->object;
>  	mutex_unlock(&item->mutex);

and

>  	mutex_lock(&item->mutex);
> -	BUG_ON(item->refcount = 0);
> +	BUG_ON(atomic_read(&item->refcount) = 0);
>  	BUG_ON(ref->object != item->object);
> -	if (--item->refcount = 0) {
> +	if (atomic_dec_and_test(&item->refcount)) {
>  		ref->release(ref);
>  		item->object = NULL;

Mind explaining how could we manage to reach either without item->mutex
being held, serializing the modifications?

NAK, in case it's not obvious from the above...
