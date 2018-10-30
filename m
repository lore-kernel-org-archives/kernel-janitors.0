From: Matt Ranostay <matt.ranostay@konsulko.com>
Date: Tue, 30 Oct 2018 16:43:10 +0000
Subject: Re: [PATCH 2/2] media: video-i2c: hwmon: constify vb2_ops structure
Message-Id: <CAJCx=gmixee=j_y9v__40x1StZXrtaK0wWrWDibMbYb3HAfnbA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1540913482-22130-1-git-send-email-Julia.Lawall@lip6.fr> <1540913482-22130-3-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1540913482-22130-3-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: kernel-janitors@vger.kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Oct 30, 2018 at 9:06 AM Julia Lawall <Julia.Lawall@lip6.fr> wrote:
>
> The vb2_ops structure can be const as it is only stored in the ops
> field of a vb2_queue structure and this field is const.
>
> Done with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Acked-by: Matt Ranostay <matt.ranostay@konsulko.com>

>
> ---
>  drivers/media/i2c/video-i2c.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
> index 4d49af86c15e..cb89cda6553d 100644
> --- a/drivers/media/i2c/video-i2c.c
> +++ b/drivers/media/i2c/video-i2c.c
> @@ -336,7 +336,7 @@ static void stop_streaming(struct vb2_queue *vq)
>         video_i2c_del_list(vq, VB2_BUF_STATE_ERROR);
>  }
>
> -static struct vb2_ops video_i2c_video_qops = {
> +static const struct vb2_ops video_i2c_video_qops = {
>         .queue_setup            = queue_setup,
>         .buf_prepare            = buffer_prepare,
>         .buf_queue              = buffer_queue,
>
