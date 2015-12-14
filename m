From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Date: Mon, 14 Dec 2015 10:03:23 +0000
Subject: Re: [PATCH 1/2] zram: Less checks in zram_bvec_write() after error detection
Message-Id: <20151214100323.GA16372@swordfish>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <566B13C1.50907@users.sourceforge.net>
 <566B14DA.1080709@users.sourceforge.net>
 <20151214002702.GA718@swordfish>
 <566E6895.5050603@users.sourceforge.net>
In-Reply-To: <566E6895.5050603@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Andrew Morton <akpm@linux-foundation.org>

On (12/14/15 07:58), SF Markus Elfring wrote:
[..]
> > keep it the way it is please.
> 
> I suggest to make the affected exception handling a bit more efficient.
> Such source code fine-tuning has got a few special consequences.

by 'more efficient' you mean saving cpu cycles on 'bvec->bv_len != PAGE_SIZE'
comparison in exception/error path?

...
check_strm:
	if (zstrm)
		zcomp_strm_release(zram->comp, zstrm);
	if (is_partial_io(bvec)) {
free_uncmem:
		kfree(uncmem);
	}
...


no.

	-ss
