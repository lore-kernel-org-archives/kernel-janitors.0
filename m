From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Date: Tue, 06 Feb 2018 20:10:03 +0000
Subject: Re: [PATCH] kasan: remove redundant initialization of variable 'real_size'
Message-Id: <e86dcb38-d00e-d5d8-ca66-9ff4013a786c@virtuozzo.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180206144950.32457-1-colin.king@canonical.com>
In-Reply-To: <20180206144950.32457-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>



On 02/06/2018 05:49 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable real_size is initialized with a value that is never read,
> it is re-assigned a new value later on, hence the initialization is
> redundant and can be removed.
> 
> Cleans up clang warning:
> lib/test_kasan.c:422:21: warning: Value stored to 'real_size' during
> its initialization is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Andrey Ryabinin <aryabinin@virtuozzo.com>

> ---
>  lib/test_kasan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/test_kasan.c b/lib/test_kasan.c
> index a808d81b409d..dba0ffd45fd7 100644
> --- a/lib/test_kasan.c
> +++ b/lib/test_kasan.c
> @@ -419,7 +419,7 @@ static noinline void __init kasan_stack_oob(void)
>  static noinline void __init ksize_unpoisons_memory(void)
>  {
>  	char *ptr;
> -	size_t size = 123, real_size = size;
> +	size_t size = 123, real_size;
>  
>  	pr_info("ksize() unpoisons the whole allocated chunk\n");
>  	ptr = kmalloc(size, GFP_KERNEL);
> 
