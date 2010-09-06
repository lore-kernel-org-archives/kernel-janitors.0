From: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Date: Mon, 06 Sep 2010 00:41:28 +0000
Subject: Re: [PATCH 13/14] mm: mempolicy: Check return code of check_range
Message-Id: <20100906093610.C8B5.A69D9226@jp.fujitsu.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283711588-7628-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1283711588-7628-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kosaki.motohiro@jp.fujitsu.com, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Lee Schermerhorn <lee.schermerhorn@hp.com>, Christoph Lameter <cl@linux-foundation.org>, David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org

> From: Vasiliy Kulikov <segooon@gmail.com>
> 
> Function check_range may return ERR_PTR(...). Check for it.

When happen this issue?

afaik, check_range return error when following condition.
 1) mm->mmap->vm_start argument is incorrect
 2) don't have neigher MPOL_MF_STATS, MPOL_MF_MOVE and MPOL_MF_MOVE_ALL

I think both case is not happen in real. Am I overlooking anything?


> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
> ---
>  Compile tested.
> 
>  mm/mempolicy.c |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index f969da5..b73f02c 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -924,12 +924,15 @@ static int migrate_to_node(struct mm_struct *mm, int source, int dest,
>  	nodemask_t nmask;
>  	LIST_HEAD(pagelist);
>  	int err = 0;
> +	struct vm_area_struct *vma;
>  
>  	nodes_clear(nmask);
>  	node_set(source, nmask);
>  
> -	check_range(mm, mm->mmap->vm_start, mm->task_size, &nmask,
> +	vma = check_range(mm, mm->mmap->vm_start, mm->task_size, &nmask,
>  			flags | MPOL_MF_DISCONTIG_OK, &pagelist);
> +	if (IS_ERR(vma))
> +		return PTR_ERR(vma);
>  
>  	if (!list_empty(&pagelist))
>  		err = migrate_pages(&pagelist, new_node_page, dest, 0);
> -- 
> 1.7.0.4
> 



