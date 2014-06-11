From: Prabhakar Lad <prabhakar.csengg@gmail.com>
Date: Wed, 11 Jun 2014 09:44:20 +0000
Subject: Re: [patch] [media] davinci: vpif: missing unlocks on error
Message-Id: <CA+V-a8vhEyNdQRqNrzRV=t-D+uh6rCEY5-qLjTOWDfHwUai1Kg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140611073108.GE16443@mwanda>
In-Reply-To: <20140611073108.GE16443@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, linux-media <linux-media@vger.kernel.org>, dlos <davinci-linux-open-source@linux.davincidsp.com>, kernel-janitors@vger.kernel.org

Hi Dan,

Thanks for the patch.

On Wed, Jun 11, 2014 at 8:31 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We recently changed some locking around so we need some new unlocks on
> the error paths.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Please review this one carefully.  I don't know if the unlock should go
> before or after the list_for_each_entry_safe() loop.
>
Yes the unlock should go after the list_for_each_entry_safe() loop
please respin another version fixing it.

Thanks,
--Prabhakar Lad

> diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
> index a7ed164..2c08fbd 100644
> --- a/drivers/media/platform/davinci/vpif_capture.c
> +++ b/drivers/media/platform/davinci/vpif_capture.c
> @@ -265,6 +265,8 @@ static int vpif_start_streaming(struct vb2_queue *vq, unsigned int count)
>         return 0;
>
>  err:
> +       spin_unlock_irqrestore(&common->irqlock, flags);
> +
>         list_for_each_entry_safe(buf, tmp, &common->dma_queue, list) {
>                 list_del(&buf->list);
>                 vb2_buffer_done(&buf->vb, VB2_BUF_STATE_QUEUED);
> diff --git a/drivers/media/platform/davinci/vpif_display.c b/drivers/media/platform/davinci/vpif_display.c
> index 5bb085b..b7b2bdf 100644
> --- a/drivers/media/platform/davinci/vpif_display.c
> +++ b/drivers/media/platform/davinci/vpif_display.c
> @@ -229,6 +229,8 @@ static int vpif_start_streaming(struct vb2_queue *vq, unsigned int count)
>         return 0;
>
>  err:
> +       spin_unlock_irqrestore(&common->irqlock, flags);
> +
>         list_for_each_entry_safe(buf, tmp, &common->dma_queue, list) {
>                 list_del(&buf->list);
>                 vb2_buffer_done(&buf->vb, VB2_BUF_STATE_QUEUED);
