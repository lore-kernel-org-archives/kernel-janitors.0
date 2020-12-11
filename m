From: Matthew Wilcox <willy@infradead.org>
Date: Fri, 11 Dec 2020 21:45:52 +0000
Subject: Re: [PATCH] hugetlb: Fix an error code in hugetlb_reserve_pages()
Message-Id: <20201211214552.GC2443@casper.infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9NGZWnZl5/Mt99R@mwanda>
 <CAFqt6zYtQ0BR_KZjJsicmmGDT1WYyYYOHqEVe1Vd5ZWLBSAVWA@mail.gmail.com>
In-Reply-To: <CAFqt6zYtQ0BR_KZjJsicmmGDT1WYyYYOHqEVe1Vd5ZWLBSAVWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Souptick Joarder <jrdr.linux@gmail.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>, Mina Almasry <almasrymina@google.com>, Andrew Morton <akpm@linux-foundation.org>, David Rientjes <rientjes@google.com>, Linux-MM <linux-mm@kvack.org>, kernel-janitors@vger.kernel.org

On Sat, Dec 12, 2020 at 01:19:28AM +0530, Souptick Joarder wrote:
> > @@ -5113,6 +5113,7 @@ int hugetlb_reserve_pages(struct inode *inode,
> >
> >                 if (unlikely(add < 0)) {
> >                         hugetlb_acct_memory(h, -gbl_reserve);
> > +                       ret = add;
> 
> This function returns int but ret is long type.
> Does it need correction ?

I wouold say "no", because 'ret' isn't returned _by_ this function (*),
its purpose is to capture the return value from other functions.

(*) OK, it is, if ret < 0.  But ret < 0 really means "Is this an error
number", which can be perfectly well represented in an int, short or long.
char is too small ;-)

So the range of values which will be placed in 'ret' is (-4096-LONG_MAX]
