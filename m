From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 07 Jan 2020 14:17:36 +0000
Subject: Re: [PATCH][next] media: v4l2-core: fix uninitialized structure fields being returned to userspace
Message-Id: <CAK8P3a0bJdKiX+=OMgCgmF158zEdgW9jYL85WqHWefhFk=ZF8Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200107140206.103711-1-colin.king@canonical.com>
In-Reply-To: <20200107140206.103711-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Linux Media Mailing List <linux-media@vger.kernel.org>, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jan 7, 2020 at 3:02 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> In the case where v4l2_event_dequeue fails the structure ev is not
> being filled and this garbage data from the stack is being copied
> to the ev32 structure and being copied back to userspace on the
> VIDIOC_DQEVENT_TIME32 ioctl.  Fix this by ensuring the ev structure
> is zero'd to ensure uninitialized data is not leaked back.
>
> Addresses-Coverity: ("Uninitialized scalar variable")
> Fixes: 1a6c0b36dd19 ("media: v4l2-core: fix VIDIOC_DQEVENT for time64 ABI")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Good catch, thanks for fixing!

Acked-by: Arnd Bergmann <arnd@arndb.de>

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index de926e311348..a376b351135f 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -394,7 +394,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>
>         case VIDIOC_DQEVENT_TIME32: {
>                 struct v4l2_event_time32 *ev32 = arg;
> -               struct v4l2_event ev;
> +               struct v4l2_event ev = { };
>
>                 if (!(sd->flags & V4L2_SUBDEV_FL_HAS_EVENTS))
>                         return -ENOIOCTLCMD;
> --
> 2.24.0
>
