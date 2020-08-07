From: Hridya Valsaraju <hridya@google.com>
Date: Fri, 07 Aug 2020 00:27:17 +0000
Subject: Re: [PATCH] staging: ion: fix spelling mistake in function name "detatch" -> "detach"
Message-Id: <CA+wgaPPL_sdo+fkQa3pqNmTadg9X6mfJZy5nyR5YTt4L6pHWtg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200805112655.17696-1-colin.king@canonical.com>
In-Reply-To: <20200805112655.17696-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "open list:ANDROID DRIVERS" <devel@driverdev.osuosl.org>, linaro-mm-sig@lists.linaro.org, Todd Kjos <tkjos@android.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, Suren Baghdasaryan <surenb@google.com>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, Joel Fernandes <joel@joelfernandes.org>, Laura Abbott <labbott@redhat.com>, Martijn Coenen <maco@android.com>, Christian Brauner <christian@brauner.io>, linux-media@vger.kernel.org

On Wed, Aug 5, 2020 at 4:26 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in the function name ion_dma_buf_detatch.
> Fix it by removing the extraneous t.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Thanks Colin!
Acked-by: Hridya Valsaraju <hridya@google.com>

>  drivers/staging/android/ion/ion.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/android/ion/ion.c b/drivers/staging/android/ion/ion.c
> index 3c9f09506ffa..e1fe03ceb7f1 100644
> --- a/drivers/staging/android/ion/ion.c
> +++ b/drivers/staging/android/ion/ion.c
> @@ -205,8 +205,8 @@ static int ion_dma_buf_attach(struct dma_buf *dmabuf,
>         return 0;
>  }
>
> -static void ion_dma_buf_detatch(struct dma_buf *dmabuf,
> -                               struct dma_buf_attachment *attachment)
> +static void ion_dma_buf_detach(struct dma_buf *dmabuf,
> +                              struct dma_buf_attachment *attachment)
>  {
>         struct ion_dma_buf_attachment *a = attachment->priv;
>         struct ion_buffer *buffer = dmabuf->priv;
> @@ -331,7 +331,7 @@ static const struct dma_buf_ops dma_buf_ops = {
>         .mmap = ion_mmap,
>         .release = ion_dma_buf_release,
>         .attach = ion_dma_buf_attach,
> -       .detach = ion_dma_buf_detatch,
> +       .detach = ion_dma_buf_detach,
>         .begin_cpu_access = ion_dma_buf_begin_cpu_access,
>         .end_cpu_access = ion_dma_buf_end_cpu_access,
>  };
> --
> 2.27.0
>
