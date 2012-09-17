From: Kent Overstreet <koverstreet@google.com>
Date: Mon, 17 Sep 2012 22:49:49 +0000
Subject: Re: [block:for-next 7/35] fs/bio.c:363 bio_alloc_bioset() error: we previously assumed 'bs' could be
Message-Id: <20120917224949.GE14492@google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120909121511.GA19841@localhost>
In-Reply-To: <20120909121511.GA19841@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Sep 09, 2012 at 02:22:26PM +0200, Jens Axboe wrote:
> On 2012-09-09 14:15, Fengguang Wu wrote:
> > Hi Kent,
> > 
> > FYI, there are new smatch warnings show up in
> > 
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
> > head:   5611a9dbd54b993fe24f322a0c310a6605824c0f
> > commit: 3f86a82aeb03e6100f7ab39f4702e033a5e38166 [7/35] block: Consolidate bio_alloc_bioset(), bio_kmalloc()
> 
> The logic in there does look both confusing and broken.
> 
> For !bs, we should not enter the bvec_alloc_bs() part. We already have
> the vec, plus bvec_alloc_bs() would crap out for !bs. That would exclude
> us from hitting err_free as well.

Yeah, it is confusing, I wasn't entirely happy with that code but I
wasn't able to come up with anything I really liked.

The reason I wrote it the way I did is that before, bio_kmalloc() would
always set bio->bi_io_vec = bio->bi_inline_vecs, even when nr_iovecs was
0, while bio_alloc_bioset() would set it to NULL.

And this is what bio_has_data() checks, which is actually used in a
decent number of places.

So I wanted to unify the behaviour as much as possible, and not have
duplicated code that could get out of sync again.

Jens, what do you want to do? If you'd prefer I could always split out
the two cases (bs and !bs) entirely and just note the bi_io_vec thing
with a comment, though I do lean toward smaller code.

Also wondering whether it'd be feasible/worthwhile to just drop
bio_kmalloc() entirely and always use a bio_set.

> Style issue on nr_iovecs check, too.

How so? Not aware of any formal style rule it breaks...
