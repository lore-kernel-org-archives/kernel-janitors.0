From: Rob Clark <robdclark@gmail.com>
Date: Thu, 14 Feb 2019 23:16:01 +0000
Subject: Re: [PATCH] drm/msm: fix an error code in the ioctl
Message-Id: <CAF6AEGtw76LLbEnpkbnLwd5Pt1P1_KiCDYcqr9mfrw=nKMo66A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190214071927.GC21768@kadam>
In-Reply-To: <20190214071927.GC21768@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-arm-msm <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, freedreno <freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>

On Thu, Feb 14, 2019 at 2:19 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The copy_to/from_user() functions return the number of bytes remaining
> to be copied but we should return -EFAULT to the user.
>
> Fixes: f05c83e77460 ("drm/msm: add uapi to get/set debug name")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> If I were reviewing this patch, I would be suspicous that we don't
> return immediately after the first copy_from_user() fails but I'm fairly
> sure that is the correct behavior.

oh, hmm, you are defn right that the current code is incorrect..

Although I guess I wonder if maybe in the -EFAULT case we should set a
null char at the end of the # of bytes copied in.  I guess the result
with your patch as-is is that you'd get part of the new debug name
string, and part of the old.  Which is maybe not incorrect or worse
than truncated new debug name.  (It is really mostly just for debugfs
after all.)

I guess we could copy_from_user() into a temp buffer to leave the old
debug name undisturbed in the -EFAULT case, but I'd accept he argument
that that would be overkill.

BR,
-R

>
>  drivers/gpu/drm/msm/msm_drv.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index b871e2e98129..1d4426cb260d 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -851,8 +851,9 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
>                         ret = -EINVAL;
>                         break;
>                 }
> -               ret = copy_from_user(msm_obj->name,
> -                       u64_to_user_ptr(args->value), args->len);
> +               if (copy_from_user(msm_obj->name, u64_to_user_ptr(args->value),
> +                                  args->len))
> +                       ret = -EFAULT;
>                 msm_obj->name[args->len] = '\0';
>                 for (i = 0; i < args->len; i++) {
>                         if (!isprint(msm_obj->name[i])) {
> @@ -868,8 +869,9 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
>                 }
>                 args->len = strlen(msm_obj->name);
>                 if (args->value) {
> -                       ret = copy_to_user(u64_to_user_ptr(args->value),
> -                                       msm_obj->name, args->len);
> +                       if (copy_to_user(u64_to_user_ptr(args->value),
> +                                        msm_obj->name, args->len))
> +                               ret = -EFAULT;
>                 }
>                 break;
>         }
> --
> 2.17.1
>
