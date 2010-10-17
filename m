From: Jens Axboe <jaxboe@fusionio.com>
Date: Sun, 17 Oct 2010 18:06:53 +0000
Subject: Re: [PATCH] block: Turn bvec_k{un,}map_irq() into static inline
Message-Id: <4CBB3B3D.5050800@fusionio.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.00.1010171335400.919@ayla.of.borg>
In-Reply-To: <alpine.DEB.2.00.1010171335400.919@ayla.of.borg>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dan Carpenter <error27@gmail.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>, "cbe-oss-dev@lists.ozlabs.org" <cbe-oss-dev@lists.ozlabs.org>

On 2010-10-17 13:38, Geert Uytterhoeven wrote:
> Convert bvec_k{un,}map_irq() from macros to static inline functions if
> !CONFIG_HIGHMEM, so we can easier detect mistakes like the one fixed in
> 93055c31045a2d5599ec613a0c6cdcefc481a460 ("ps3disk: passing wrong variable to
> bvec_kunmap_irq()")

Does this cause any warnings on the existing kernel? It's the same issue
we have with the kunmap_atomic() API, and they are generally used to map
structures etc as well. So char * isn't necessarily always a good
choice, and hence the "fix" there is to just check whether a page struct
is being passed in or not.

OK, so did a quick grep, and there's just the two users of it. So pretty
straight forward, I'll add your patch. Thanks!

-- 
Jens Axboe

