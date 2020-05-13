From: Ralph Campbell <rcampbell@nvidia.com>
Date: Wed, 13 May 2020 19:08:36 +0000
Subject: Re: [PATCH] mm/hmm/test: fix an error code in hmm_dmirror_init()
Message-Id: <86b773ef-bc31-7d1c-f271-583c1f0a420a@nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200513094225.GE347693@mwanda>
In-Reply-To: <20200513094225.GE347693@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>
Cc: linux-mm@kvack.org, kernel-janitors@vger.kernel.org


On 5/13/20 2:42 AM, Dan Carpenter wrote:
> If the allocation fails, then this should return -ENOMEM instead of
> success.
> 
> Fixes: a149d2eb654b ("mm/hmm/test: add selftest driver for HMM")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>   lib/test_hmm.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 00bca6116f930..b4d9434e49e72 100644
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

Thanks for fixing this. It looks like Wei Yongjun beat you to it
and Jason Gunthorpe has applied it to the hmm tree.

https://lore.kernel.org/linux-mm/20200512195932.GB9154@ziepe.ca/
