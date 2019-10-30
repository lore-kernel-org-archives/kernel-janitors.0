From: John Stultz <john.stultz@linaro.org>
Date: Wed, 30 Oct 2019 16:17:14 +0000
Subject: Re: [PATCH] dma-buf: Fix a warning message in dma_heap_buffer_destroy()
Message-Id: <CALAqxLU7k-z6JXbEFpK0D_7+jZz_Jdk7HxaSWm_rkBFEpQRQtg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191029182943.GD17569@mwanda>
In-Reply-To: <20191029182943.GD17569@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, "Andrew F. Davis" <afd@ti.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Liam Mark <lmark@codeaurora.org>, Laura Abbott <labbott@redhat.com>, Brian Starkey <Brian.Starkey@arm.com>, linux-media@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>, lkml <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Oct 29, 2019 at 11:31 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The first argument of WARN() is a condition so this will just print the
> function name instead of the whole warning message.
>
> Fixes: 7b87ea704fd9 ("dma-buf: heaps: Add heap helpers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/dma-buf/heaps/heap-helpers.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/heaps/heap-helpers.c b/drivers/dma-buf/heaps/heap-helpers.c
> index 750bef4e902d..a31684c0d5b2 100644
> --- a/drivers/dma-buf/heaps/heap-helpers.c
> +++ b/drivers/dma-buf/heaps/heap-helpers.c
> @@ -52,7 +52,7 @@ static void *dma_heap_map_kernel(struct heap_helper_buffer *buffer)
>  static void dma_heap_buffer_destroy(struct heap_helper_buffer *buffer)
>  {
>         if (buffer->vmap_cnt > 0) {
> -               WARN("%s: buffer still mapped in the kernel\n", __func__);
> +               WARN(1, "%s: buffer still mapped in the kernel\n", __func__);
>                 vunmap(buffer->vaddr);
>         }

Thanks for catching and reporting this!

Acked-by: John Stultz <john.stultz@linaro.org>

Sumit, do you mind picking this up for drm-misc-next?

thanks
-john
