From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Tue, 16 Jun 2015 12:41:49 +0000
Subject: Re: [patch] drm/amdkfd: fix some range checks in address watch ioctl
Message-Id: <CAFCwf12RoBTtHBdu5j5Jot7q=2k3G9xc0v1VgbtGHCub7Drh3w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150611151902.GF12192@mwanda>
In-Reply-To: <20150611151902.GF12192@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Yair Shachar <yair.shachar@amd.com>, John Bridgman <John.Bridgman@amd.com>
Cc: David Airlie <airlied@linux.ie>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Jun 11, 2015 at 6:19 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index 96c904b..54a608a 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -553,7 +554,7 @@ static int kfd_ioctl_dbg_address_watch(struct file *filep,
>         /* Validate arguments */
>
>         if ((args->buf_size_in_bytes > MAX_ALLOWED_AW_BUFF_SIZE) ||
> -               (args->buf_size_in_bytes <= sizeof(*args)) ||
> +               (args->buf_size_in_bytes <= sizeof(*args) + sizeof(int) * 2) ||
>                 (cmd_from_user = NULL))
>                 return -EINVAL;
>
> @@ -590,7 +596,7 @@ static int kfd_ioctl_dbg_address_watch(struct file *filep,
>         /* skip over the addresses buffer */
>         args_idx += sizeof(aw_info.watch_address) * aw_info.num_watch_points;
>
> -       if (args_idx >= args->buf_size_in_bytes) {
> +       if (args_idx >= args->buf_size_in_bytes - sizeof(*args)) {
>                 kfree(args_buff);
>                 return -EINVAL;
>         }
> @@ -614,7 +620,7 @@ static int kfd_ioctl_dbg_address_watch(struct file *filep,
>                 args_idx += sizeof(aw_info.watch_mask);
>         }
>
> -       if (args_idx > args->buf_size_in_bytes) {
> +       if (args_idx >= args->buf_size_in_bytes - sizeof(args)) {
>                 kfree(args_buff);
>                 return -EINVAL;
>         }

Hi Dan,

I took the above section and made a patch from them which I then
applied to my -next-fixes tree (to be included in 4.2 merge window).
Thanks!

Yair,
I suggest you take my amdkfd-next-fixes branch and test it with your
debugger tests.

John,
If you could try publishing kfdtest as we talked about, that would be
great because then everyone will be able to check this.

   Oded
