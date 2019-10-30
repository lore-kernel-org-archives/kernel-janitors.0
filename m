From: "Andrew F. Davis" <afd@ti.com>
Date: Wed, 30 Oct 2019 15:45:29 +0000
Subject: Re: [PATCH][next] dma-buf: heaps: remove redundant assignment to variable ret
Message-Id: <673b3e8f-9211-2fa2-c408-4560b03b4700@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191030150253.10596-1-colin.king@canonical.com>
In-Reply-To: <20191030150253.10596-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Sumit Semwal <sumit.semwal@linaro.org>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>, Brian Starkey <brian.starkey@arm.com>, John Stultz <john.stultz@linaro.org>, linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/30/19 11:02 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being assigned with a value that is never
> read, it is being re-assigned the same value on the err0 exit
> path. The assignment is redundant and hence can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Fixes: 47a32f9c1226 ("dma-buf: heaps: Add system heap to dmabuf heaps")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---


The root of the issue is that ret is not used in the error path, it
should be, I suggest this fix:

> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -98,7 +98,7 @@ static int system_heap_allocate(struct dma_heap *heap,
>  err0:
>         kfree(helper_buffer);
>  
> -       return -ENOMEM;
> +       return ret;
>  }
>  
>  static const struct dma_heap_ops system_heap_ops = {

Andrew


>  drivers/dma-buf/heaps/system_heap.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index 455782efbb32..817a1667bd57 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -55,10 +55,8 @@ static int system_heap_allocate(struct dma_heap *heap,
>  	helper_buffer->pages = kmalloc_array(helper_buffer->pagecount,
>  					     sizeof(*helper_buffer->pages),
>  					     GFP_KERNEL);
> -	if (!helper_buffer->pages) {
> -		ret = -ENOMEM;
> +	if (!helper_buffer->pages)
>  		goto err0;
> -	}
>  
>  	for (pg = 0; pg < helper_buffer->pagecount; pg++) {
>  		/*
> 
