From: Ezequiel Garcia <elezegarcia@gmail.com>
Date: Wed, 24 Oct 2012 00:50:27 +0000
Subject: Re: [PATCH 04/23] sn9c102: Replace memcpy with struct assignment
Message-Id: <CALF0-+XQHAC=eGigmA6QOO27PPG39Q1yGFiebtJ5sJyqbF55vw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351022246-8201-1-git-send-email-elezegarcia@gmail.com>
	<1351022246-8201-4-git-send-email-elezegarcia@gmail.com>
In-Reply-To: <1351022246-8201-4-git-send-email-elezegarcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Julia.Lawall@lip6.fr, kernel-janitors@vger.kernel.org, Ezequiel Garcia <elezegarcia@gmail.com>, Peter Senna Tschudin <peter.senna@gmail.com>, Andy Walls <awalls@md.metrocast.net>

On Tue, Oct 23, 2012 at 4:57 PM, Ezequiel Garcia <elezegarcia@gmail.com> wrote:
> This kind of memcpy() is error-prone. Its replacement with a struct
> assignment is prefered because it's type-safe and much easier to read.
>
> Found by coccinelle. Hand patched and reviewed.
> Tested by compilation only.
>
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @@
> identifier struct_name;
> struct struct_name to;
> struct struct_name from;
> expression E;
> @@
> -memcpy(&(to), &(from), E);
> +to = from;
> // </smpl>
>
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
> Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
> ---
>  drivers/media/usb/sn9c102/sn9c102_core.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/usb/sn9c102/sn9c102_core.c b/drivers/media/usb/sn9c102/sn9c102_core.c
> index 5bfc8e2..4cae6f8 100644
> --- a/drivers/media/usb/sn9c102/sn9c102_core.c
> +++ b/drivers/media/usb/sn9c102/sn9c102_core.c
> @@ -2824,7 +2824,7 @@ sn9c102_vidioc_querybuf(struct sn9c102_device* cam, void __user * arg)
>             b.index >= cam->nbuffers || cam->io != IO_MMAP)
>                 return -EINVAL;
>
> -       memcpy(&b, &cam->frame[b.index].buf, sizeof(b));
> +       b = cam->frame[b.index].buf;
>
>         if (cam->frame[b.index].vma_use_count)
>                 b.flags |= V4L2_BUF_FLAG_MAPPED;
> @@ -2927,7 +2927,7 @@ sn9c102_vidioc_dqbuf(struct sn9c102_device* cam, struct file* filp,
>
>         f->state = F_UNUSED;
>
> -       memcpy(&b, &f->buf, sizeof(b));
> +       b = f->buf;
>         if (f->vma_use_count)
>                 b.flags |= V4L2_BUF_FLAG_MAPPED;
>

Andy: you got me thinking on performance.
Most patches are initialization or setup code.

Here we patch a xxx_vidioc_dqbuf() function.
Is this a speed sensitive path?

I still think this change can't hurt performance,
but I may be wrong!


    Ezequiel
