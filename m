From: Ralph Campbell <rcampbell@nvidia.com>
Date: Mon, 11 May 2020 17:20:17 +0000
Subject: Re: [PATCH -next] mm/hmm/test: fix error return code in hmm_dmirror_init()
Message-Id: <b8da4751-ea8a-7e4d-9a6c-ee6bd7038eb7@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200509030234.14747-1-weiyongjun1@huawei.com>
In-Reply-To: <20200509030234.14747-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, jglisse@redhat.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>


On 5/8/20 8:02 PM, Wei Yongjun wrote:
> Fix to return negative error code -ENOMEM from the alloc_page() error
> handling case instead of 0, as done elsewhere in this function.
> 
> Fixes: 5d5e54be8a1e ("mm/hmm/test: add selftest driver for HMM")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Looks good, thanks!
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

> ---
>   lib/test_hmm.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 00bca6116f93..b4d9434e49e7 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -1119,8 +1119,10 @@ static int __init hmm_dmirror_init(void)
>   	 * make the code here simpler (i.e., we need a struct page for it).
>   	 */
>   	dmirror_zero_page = alloc_page(GFP_HIGHUSER | __GFP_ZERO);
> -	if (!dmirror_zero_page)
> +	if (!dmirror_zero_page) {
> +		ret = -ENOMEM;
>   		goto err_chrdev;
> +	}
>   
>   	pr_info("HMM test module loaded. This is only for testing HMM.\n");
>   	return 0;
> 
> 
> 
