From: walter harms <wharms@bfs.de>
Date: Fri, 07 Sep 2012 15:26:59 +0000
Subject: Re: [PATCH] ../linux-next/drivers/media/pci/cx25821/cx25821-video-upstream-ch2.c: fix error return c
Message-Id: <504A1243.8060409@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1347025088-11616-1-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1347025088-11616-1-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Peter Senna Tschudin <peter.senna@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 07.09.2012 15:38, schrieb Peter Senna Tschudin:
> From: Peter Senna Tschudin <peter.senna@gmail.com>
>=20
> Convert a nonnegative error return code to a negative one, as returned
> elsewhere in the function.
>=20
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)
>=20
> // <smpl>
> (
> if@p1 (\(ret < 0\|ret !=3D 0\))
>  { ... return ret; }
> |
> ret@p1 =3D 0
> )
> ... when !=3D ret =3D e1
>     when !=3D &ret
> *if(...)
> {
>   ... when !=3D ret =3D e2
>       when forall
>  return ret;
> }
>=20
> // </smpl>
>=20
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
>=20
> ---
>  drivers/media/pci/cx25821/cx25821-video-upstream-ch2.c |   15 +++++++++-=
-----
>  1 file changed, 9 insertions(+), 6 deletions(-)
>=20
> diff --git a/../linux-next/drivers/media/pci/cx25821/cx25821-video-upstre=
am-ch2.c b/drivers/media/pci/cx25821/cx25821-video-upstream-ch2.c
> index c8c94fb..273df94 100644
> --- a/../linux-next/drivers/media/pci/cx25821/cx25821-video-upstream-ch2.c
> +++ b/drivers/media/pci/cx25821/cx25821-video-upstream-ch2.c
> @@ -704,7 +704,6 @@ int cx25821_vidupstream_init_ch2(struct cx25821_dev *=
dev, int channel_select,
>  {
>  	struct sram_channel *sram_ch;
>  	u32 tmp;
> -	int retval =3D 0;
>  	int err =3D 0;
>  	int data_frame_size =3D 0;
>  	int risc_buffer_size =3D 0;
> @@ -749,15 +748,19 @@ int cx25821_vidupstream_init_ch2(struct cx25821_dev=
 *dev, int channel_select,
>  		dev->_filename_ch2 =3D kmemdup(dev->input_filename_ch2,
>  					     str_length + 1, GFP_KERNEL);
> =20
> -		if (!dev->_filename_ch2)
> +		if (!dev->_filename_ch2) {
> +			err =3D -ENOENT;
>  			goto error;
> +		}
>  	} else {
>  		str_length =3D strlen(dev->_defaultname_ch2);
>  		dev->_filename_ch2 =3D kmemdup(dev->_defaultname_ch2,
>  					     str_length + 1, GFP_KERNEL);
> =20
> -		if (!dev->_filename_ch2)
> +		if (!dev->_filename_ch2) {
> +			err =3D -ENOENT;
>  			goto error;
> +		}
>  	}
> =20

This should be done properly:

if (dev->input_filename_ch2)
	str=DEv->input_filename_ch2;
else
	str=DEv->_defaultname_ch2;

dev->_filename_ch2=3Dkstrdup(str,GFP_KERNEL);
if (!dev->_filename_ch2) {
			err =3D -ENOENT;
			goto error;
		}

hope that helps
re,
 wh



>  	/* Default if filename is empty string */
> @@ -773,7 +776,7 @@ int cx25821_vidupstream_init_ch2(struct cx25821_dev *=
dev, int channel_select,
>  		}
>  	}
> =20
> -	retval =3D cx25821_sram_channel_setup_upstream(dev, sram_ch,
> +	err =3D cx25821_sram_channel_setup_upstream(dev, sram_ch,
>  						dev->_line_size_ch2, 0);
> =20
>  	/* setup fifo + format */
> @@ -783,9 +786,9 @@ int cx25821_vidupstream_init_ch2(struct cx25821_dev *=
dev, int channel_select,
>  	dev->upstream_databuf_size_ch2 =3D data_frame_size * 2;
> =20
>  	/* Allocating buffers and prepare RISC program */
> -	retval =3D cx25821_upstream_buffer_prepare_ch2(dev, sram_ch,
> +	err =3D cx25821_upstream_buffer_prepare_ch2(dev, sram_ch,
>  						dev->_line_size_ch2);
> -	if (retval < 0) {
> +	if (err < 0) {
>  		pr_err("%s: Failed to set up Video upstream buffers!\n",
>  		       dev->name);
>  		goto error;
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
