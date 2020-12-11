From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Fri, 11 Dec 2020 19:52:23 +0000
Subject: Re: [PATCH] hugetlb: Fix an error code in hugetlb_reserve_pages()
Message-Id: <CAFqt6zYtQ0BR_KZjJsicmmGDT1WYyYYOHqEVe1Vd5ZWLBSAVWA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9NGZWnZl5/Mt99R@mwanda>
In-Reply-To: <X9NGZWnZl5/Mt99R@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mike Kravetz <mike.kravetz@oracle.com>, Mina Almasry <almasrymina@google.com>, Andrew Morton <akpm@linux-foundation.org>, David Rientjes <rientjes@google.com>, Linux-MM <linux-mm@kvack.org>, kernel-janitors@vger.kernel.org

Hi Dan,

On Fri, Dec 11, 2020 at 3:44 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Preserve the error code from region_add() instead of returning success.
>
> Fixes: 0db9d74ed884 ("hugetlb: disable region_add file_region coalescing")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> From static analysis.  Untested.
>
>  mm/hugetlb.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 1f3bf1710b66..ac2e48b9f1d7 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -5113,6 +5113,7 @@ int hugetlb_reserve_pages(struct inode *inode,
>
>                 if (unlikely(add < 0)) {
>                         hugetlb_acct_memory(h, -gbl_reserve);
> +                       ret = add;

This function returns int but ret is long type.
Does it need correction ?

>                         goto out_put_pages;
>                 } else if (unlikely(chg > add)) {
>                         /*
> --
> 2.29.2
>
>
