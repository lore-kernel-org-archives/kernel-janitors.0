From: "Christophe JAILLET" <christophe.jaillet@wanadoo.fr>
Date: Sun, 28 Mar 2010 15:09:48 +0000
Subject: Re: [patch] video/sn9c102: improve error handling
Message-Id: <honrg5$7uk$1@dough.gmane.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100328115005.GW5069@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-kernel@vger.kernel.org
Cc: linux-usb@vger.kernel.org, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,

this patch seems incomplete.

You had an opening { wityhout the corresponding }.

Best regards,
Christophe Jaillet.

"Dan Carpenter" <error27@gmail.com> a =E9crit
dans le message de news:20100328115005.GW5069@bicker...
> Return an error if the controller is not found.
>
> Signed-off-by: Dan Carpenter
<error27@gmail.com>
>
> diff --git a/drivers/media/video/sn9c102/sn9c102_core.c
b/drivers/media/video/sn9c102/sn9c102_core.c
> index cbf8087..28e19da 100644
> --- a/drivers/media/video/sn9c102/sn9c102_core.c
> +++ b/drivers/media/video/sn9c102/sn9c102_core.c
> @@ -2295,7 +2295,7 @@ sn9c102_vidioc_s_ctrl(struct sn9c102_device* cam,
void __user * arg)
>   if (copy_from_user(&ctrl, arg, sizeof(ctrl)))
>   return -EFAULT;
>
> - for (i =3D 0; i < ARRAY_SIZE(s->qctrl); i++)
> + for (i =3D 0; i < ARRAY_SIZE(s->qctrl); i++) {
>   if (ctrl.id =3D s->qctrl[i].id) {
>   if (s->qctrl[i].flags & V4L2_CTRL_FLAG_DISABLED)
>   return -EINVAL;
> @@ -2305,7 +2305,9 @@ sn9c102_vidioc_s_ctrl(struct sn9c102_device* cam,
void __user * arg)
>   ctrl.value -=3D ctrl.value % s->qctrl[i].step;
>   break;
>   }



--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
