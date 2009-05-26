From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Tue, 26 May 2009 00:20:04 +0000
Subject: Re: [PATCH] oss: Remove void casts
Message-Id: <919fe2b30905251720n24837f56xf24a93ca7bdf89ae@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5c43c2d40905220627g4036fd80n6f0ef8469e48aa1f@mail.gmail.com>
In-Reply-To: <5c43c2d40905220627g4036fd80n6f0ef8469e48aa1f@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?ISO-8859-1?Q?Andr=E9_Lopes?= <andre.neo.net@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, askulysh@image.kiev.ua

2009/5/22 Andr=E9 Lopes <andre.neo.net@gmail.com>:
> This trivial patch just remove void cats from sound/oss/sh_dac_audio.c

darn cats got out again :P

s/void cats/void pointer casts/

Regards,
Mark

>
> Signed-off-by: Andr=E9 Lopes <andre.neo.net@gmail.com>
>
> ---
> =A0sound/oss/sh_dac_audio.c | =A0 10 +++++-----
> =A01 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/sound/oss/sh_dac_audio.c b/sound/oss/sh_dac_audio.c
> index 78cfb66..7247ea1 100755
> --- a/sound/oss/sh_dac_audio.c
> +++ b/sound/oss/sh_dac_audio.c
> @@ -200,21 +200,21 @@ static ssize_t dac_audio_write(struct file
> *file, const char *buf, size_t count,
> =A0 =A0 =A0 =A0if (count > free)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0count =3D free;
> =A0 =A0 =A0 =A0if (buffer_begin > buffer_end) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (copy_from_user((void *)buffer_end, buf,=
 count))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (copy_from_user(buffer_end, buf, count))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EFAULT;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0buffer_end +=3D count;
> =A0 =A0 =A0 =A0} else {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0nbytes =3D data_buffer + BUFFER_SIZE - buf=
fer_end;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (nbytes > count) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (copy_from_user((void *)=
buffer_end, buf, count))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (copy_from_user(buffer_e=
nd, buf, count))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EF=
AULT;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0buffer_end +=3D count;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} else {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (copy_from_user((void *)=
buffer_end, buf, nbytes))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (copy_from_user(buffer_e=
nd, buf, nbytes))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EF=
AULT;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (copy_from_user
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ((void *)data_buffe=
r, buf + nbytes, count - nbytes))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (data_buffer, buf +=
 nbytes, count - nbytes))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EF=
AULT;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0buffer_end =3D data_buffer=
 + count - nbytes;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> @@ -322,7 +322,7 @@ static void __exit dac_audio_exit(void)
> =A0 =A0 =A0 =A0free_irq(TIMER1_IRQ, 0);
>
> =A0 =A0 =A0 =A0unregister_sound_dsp(device_major);
> - =A0 =A0 =A0 kfree((void *)data_buffer);
> + =A0 =A0 =A0 kfree(data_buffer);
> =A0}
>
> =A0module_init(dac_audio_init);
> --
> 1.5.6.5
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
