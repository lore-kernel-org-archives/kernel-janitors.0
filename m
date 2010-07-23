From: Devin Heitmueller <dheitmueller@kernellabs.com>
Date: Fri, 23 Jul 2010 13:12:37 +0000
Subject: Re: [patch -next] V4L: au0828: move dereference below sanity checks
Message-Id: <AANLkTi=4-973-tomyGeF1X6EXGzhcgWXeNZ6mZ=awMF+@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100723100920.GC26313@bicker>
In-Reply-To: <20100723100920.GC26313@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <error27@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Greg Kroah-Hartman <gregkh@suse.de>, Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jul 23, 2010 at 6:09 AM, Dan Carpenter <error27@gmail.com> wrote:
> This function has sanity checks to make sure that "dev" is non-null. =A0I
> moved the dereference down below the checks. =A0In the current code "dev"
> is never actually null.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
>
> diff --git a/drivers/media/video/au0828/au0828-video.c b/drivers/media/vi=
deo/au0828/au0828-video.c
> index d97e0a2..7989a7b 100644
> --- a/drivers/media/video/au0828/au0828-video.c
> +++ b/drivers/media/video/au0828/au0828-video.c
> @@ -441,7 +441,7 @@ static void au0828_copy_vbi(struct au0828_dev *dev,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned char =
*outp, unsigned long len)
> =A0{
> =A0 =A0 =A0 =A0unsigned char *startwrite, *startread;
> - =A0 =A0 =A0 int bytesperline =3D dev->vbi_width;
> + =A0 =A0 =A0 int bytesperline;
> =A0 =A0 =A0 =A0int i, j =3D 0;
>
> =A0 =A0 =A0 =A0if (dev =3D NULL) {
> @@ -464,6 +464,8 @@ static void au0828_copy_vbi(struct au0828_dev *dev,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> =A0 =A0 =A0 =A0}
>
> + =A0 =A0 =A0 bytesperline =3D dev->vbi_width;
> +
> =A0 =A0 =A0 =A0if (dma_q->pos + len > buf->vb.size)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0len =3D buf->vb.size - dma_q->pos;
>
>

In reality the check for "dev" can be removed since it will *never*
happen (I added it during some debugging, as can be seen by the rest
of the NULL checks).

Either way though, this patch is fine.

Acked-by: Devin Heitmueller <dheitmueller@kernellabs.com>

--=20
Devin J. Heitmueller - Kernel Labs
http://www.kernellabs.com
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
