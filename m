From: David Hildenbrand <david@redhat.com>
Date: Mon, 03 Dec 2018 11:11:55 +0000
Subject: Re: [PATCH -next] mm/hmm: remove set but not used variable 'devmem'
Message-Id: <c009d3b3-3ae5-948d-992a-393b64d25275@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1543629971-128377-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1543629971-128377-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, jglisse@redhat.com, akpm@linux-foundation.org, sfr@canb.auug.org.au, dan.j.williams@intel.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 01.12.18 03:06, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> mm/hmm.c: In function 'hmm_devmem_ref_kill':
> mm/hmm.c:995:21: warning:
>  variable 'devmem' set but not used [-Wunused-but-set-variable]
> 
> It not used any more since commit 35d39f953d4e ("mm, hmm: replace
> hmm_devmem_pages_create() with devm_memremap_pages()")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  mm/hmm.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/mm/hmm.c b/mm/hmm.c
> index 50fbaf8..361f370 100644
> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -992,9 +992,6 @@ static void hmm_devmem_ref_exit(void *data)
>  
>  static void hmm_devmem_ref_kill(struct percpu_ref *ref)
>  {
> -	struct hmm_devmem *devmem;
> -
> -	devmem = container_of(ref, struct hmm_devmem, ref);
>  	percpu_ref_kill(ref);
>  }
> 
> 
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 

Thanks,

David / dhildenb
