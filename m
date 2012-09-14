From: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 14 Sep 2012 21:13:59 +0000
Subject: Re: [memcg:since-3.5 93/137] include/linux/rbtree_augmented.h:123: warning: '__rb_erase_color' decla
Message-Id: <20120914141359.632d464f.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120914025922.GD31454@yliu-dev.sh.intel.com>
In-Reply-To: <20120914025922.GD31454@yliu-dev.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 14 Sep 2012 14:10:04 -0700
Andrew Morton <akpm@linux-foundation.org> wrote:

> akpm:/usr/src/25> size lib/rbtree_test.o
>    text    data     bss     dec     hex filename
>    3599     117    5224    8940    22ec lib/rbtree_test.o	(before)
>    4176     117    5384    9677    25cd lib/rbtree_test.o	(after)
> 
> that's crazy!

Although the changelog and Documentation/rbtree.txt do explain the
situation. Nobody ever reads them.  This explanation should be in a
big fat comment at the rb_erase_augmented() site, please.
