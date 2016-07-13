From: Rob Clark <robdclark@gmail.com>
Date: Wed, 13 Jul 2016 12:56:45 +0000
Subject: Re: [patch] drm/msm: return -EFAULT instead of bytes remaining
Message-Id: <CAF6AEGvL_zPTNd961vedKkjLUuXV4Qfj-JQL0b5RsQx_cxZjBg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160713103529.GL29468@mwanda>
In-Reply-To: <20160713103529.GL29468@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

On Wed, Jul 13, 2016 at 6:35 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> copy_to/from_user returns the number of bytes remaining to be copied but
> we want to return -EFAULT.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

thanks, I've added to msm-next

BR,
-R

>
> diff --git a/drivers/gpu/drm/msm/msm_perf.c b/drivers/gpu/drm/msm/msm_perf.c
> index 830857c..17fe4e5 100644
> --- a/drivers/gpu/drm/msm/msm_perf.c
> +++ b/drivers/gpu/drm/msm/msm_perf.c
> @@ -132,7 +132,7 @@ static ssize_t perf_read(struct file *file, char __user *buf,
>                 size_t sz, loff_t *ppos)
>  {
>         struct msm_perf_state *perf = file->private_data;
> -       int n = 0, ret;
> +       int n = 0, ret = 0;
>
>         mutex_lock(&perf->read_lock);
>
> @@ -143,9 +143,10 @@ static ssize_t perf_read(struct file *file, char __user *buf,
>         }
>
>         n = min((int)sz, perf->buftot - perf->bufpos);
> -       ret = copy_to_user(buf, &perf->buf[perf->bufpos], n);
> -       if (ret)
> +       if (copy_to_user(buf, &perf->buf[perf->bufpos], n)) {
> +               ret = -EFAULT;
>                 goto out;
> +       }
>
>         perf->bufpos += n;
>         *ppos += n;
> diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
> index 24254e0..3a5fdfc 100644
> --- a/drivers/gpu/drm/msm/msm_rd.c
> +++ b/drivers/gpu/drm/msm/msm_rd.c
> @@ -149,9 +149,10 @@ static ssize_t rd_read(struct file *file, char __user *buf,
>                 goto out;
>
>         n = min_t(int, sz, circ_count_to_end(&rd->fifo));
> -       ret = copy_to_user(buf, fptr, n);
> -       if (ret)
> +       if (copy_to_user(buf, fptr, n)) {
> +               ret = -EFAULT;
>                 goto out;
> +       }
>
>         fifo->tail = (fifo->tail + n) & (BUF_SZ - 1);
>         *ppos += n;
