From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 14 Dec 2020 06:30:21 +0000
Subject: Re: [PATCH] hugetlb: Fix an error code in hugetlb_reserve_pages()
Message-Id: <20201214063021.GA2809@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9NGZWnZl5/Mt99R@mwanda>
 <CAFqt6zYtQ0BR_KZjJsicmmGDT1WYyYYOHqEVe1Vd5ZWLBSAVWA@mail.gmail.com>
In-Reply-To: <CAFqt6zYtQ0BR_KZjJsicmmGDT1WYyYYOHqEVe1Vd5ZWLBSAVWA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Souptick Joarder <jrdr.linux@gmail.com>
Cc: Mike Kravetz <mike.kravetz@oracle.com>, Mina Almasry <almasrymina@google.com>, Andrew Morton <akpm@linux-foundation.org>, David Rientjes <rientjes@google.com>, Linux-MM <linux-mm@kvack.org>, kernel-janitors@vger.kernel.org

On Sat, Dec 12, 2020 at 01:19:28AM +0530, Souptick Joarder wrote:
> Hi Dan,
> 
> On Fri, Dec 11, 2020 at 3:44 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > Preserve the error code from region_add() instead of returning success.
> >
> > Fixes: 0db9d74ed884 ("hugetlb: disable region_add file_region coalescing")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > From static analysis.  Untested.
> >
> >  mm/hugetlb.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > index 1f3bf1710b66..ac2e48b9f1d7 100644
> > --- a/mm/hugetlb.c
> > +++ b/mm/hugetlb.c
> > @@ -5113,6 +5113,7 @@ int hugetlb_reserve_pages(struct inode *inode,
> >
> >                 if (unlikely(add < 0)) {
> >                         hugetlb_acct_memory(h, -gbl_reserve);
> > +                       ret = add;
> 
> This function returns int but ret is long type.
> Does it need correction ?
>

It doesn't *need* correction.  The code works fine as-is.  Smatch parses
it correctly, also.  Hard to say if making it "ret" makes the code
simpler or more complicated for a human reader.

regards,
dan carpenter
