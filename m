From: Michal Hocko <mhocko@kernel.org>
Date: Sun, 10 Dec 2017 09:45:45 +0000
Subject: Re: [PATCH] mm: Release a semaphore in 'get_vaddr_frames()'
Message-Id: <20171210094545.GW20234@dhcp22.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171209070941.31828-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20171209070941.31828-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: dan.j.williams@intel.com, akpm@linux-foundation.org, borntraeger@de.ibm.com, dsterba@suse.com, gregkh@linuxfoundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat 09-12-17 08:09:41, Christophe JAILLET wrote:
> A semaphore is acquired before this check, so we must release it before
> leaving.
> 
> Fixes: b7f0554a56f2 ("mm: fail get_vaddr_frames() for filesystem-dax mappings")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> -- Untested --
> 
> The wording of the commit entry and log description could be improved
> but I didn't find something better.

The changelog is ok imo.

> ---
>  mm/frame_vector.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/frame_vector.c b/mm/frame_vector.c
> index 297c7238f7d4..e0c5e659fa82 100644
> --- a/mm/frame_vector.c
> +++ b/mm/frame_vector.c
> @@ -62,8 +62,10 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
>  	 * get_user_pages_longterm() and disallow it for filesystem-dax
>  	 * mappings.
>  	 */
> -	if (vma_is_fsdax(vma))
> +	if (vma_is_fsdax(vma)) {
> +		up_read(&mm->mmap_sem);
>  		return -EOPNOTSUPP;
> +	}

Is there any reason to do a different error handling than other error
paths? Namely not going without goto out?

>  
>  	if (!(vma->vm_flags & (VM_IO | VM_PFNMAP))) {
>  		vec->got_ref = true;
> -- 
> 2.14.1
> 

-- 
Michal Hocko
SUSE Labs
