From: Todor Tomov <todor.tomov@linaro.org>
Date: Mon, 12 Mar 2018 09:30:44 +0000
Subject: Re: [PATCH v3] [media] Use common error handling code in 19 functions
Message-Id: <68dad3db-3bec-7f87-02a0-d77b304fb0ee@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <227d2d7c-5aee-1190-1624-26596a048d9c@users.sourceforge.net>
 <57ef3a56-2578-1d5f-1268-348b49b0c573@users.sourceforge.net>
In-Reply-To: <57ef3a56-2578-1d5f-1268-348b49b0c573@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>, Sean Young <sean@mess.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Shyam Saini <mayhs11saini@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: linux-media@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Andi Shyti <andi.shyti@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, Andrey Utkin <andrey_utkin@fastmail.com>, Arvind Yadav <arvind.yadav.cs@gmail.com>, Bhumika Goyal <bhumirks@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Brian Johnson <brijohn@gmail.com>, =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph@boehmwalder.at>, Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Colin Ian King <colin.king@canonical.com>, Daniele Nicolodi <daniele@grinta.net>, =?UTF-8?Q?David_H=c3=a4rdeman?= <david@hardeman.nu>, Devendra Sharma <devendra.sharma9091@gmail.com>, "Gustavo A. R. Silva" <garsilva@embeddedor.com>, Hans Verkuil <hans.verkuil@cisco.com>, Inki Dae <inki.dae@samsung.com>, Joe Perches <joe@perches.com>, Kees Cook <keescook@chromium.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Max Kellermann <max.kellermann@gmail.com>, Mike Isely <isely@pobox.com>, Philippe Ombredanne <pombredanne@nexb.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Santosh Kumar Singh <kumar.san1093@gmail.com>, Satendra Singh Thakur <satendra.t@samsung.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Markus,

Thank you for the patch.

On  9.03.2018 22:10, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 9 Mar 2018 21:00:12 +0100
>=20
> Adjust jump targets so that a bit of exception handling can be better
> reused at the end of these functions.
>=20
> This issue was partly detected by using the Coccinelle software.
>=20
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>=20
> v3:
> Laurent Pinchart and Todor Tomov requested a few adjustments.
> Updates were rebased on source files from Linux next-20180308.
>=20
> v2:
> Hans Verkuil insisted on patch squashing. Thus several changes
> were recombined based on source files from Linux next-20180216.
>=20
> The implementation of the function "tda8261_set_params" was improved
> after a notification by Christoph B=C3=B6hmwalder on 2017-09-26.
>=20
>  drivers/media/dvb-core/dmxdev.c                    | 16 ++++----
>  drivers/media/dvb-frontends/tda1004x.c             | 20 ++++++----
>  drivers/media/dvb-frontends/tda8261.c              | 19 ++++++----
>  drivers/media/pci/bt8xx/dst.c                      | 19 ++++++----
>  drivers/media/pci/bt8xx/dst_ca.c                   | 30 +++++++--------
>  drivers/media/pci/cx88/cx88-input.c                | 17 +++++----
>  drivers/media/platform/omap3isp/ispvideo.c         | 28 ++++++--------
>  .../media/platform/qcom/camss-8x16/camss-csid.c    | 19 +++++-----
>  drivers/media/tuners/tuner-xc2028.c                | 30 +++++++--------
>  drivers/media/usb/cpia2/cpia2_usb.c                | 13 ++++---
>  drivers/media/usb/gspca/gspca.c                    | 17 +++++----
>  drivers/media/usb/gspca/sn9c20x.c                  | 17 +++++----
>  drivers/media/usb/pvrusb2/pvrusb2-ioread.c         | 10 +++--
>  drivers/media/usb/tm6000/tm6000-cards.c            |  7 ++--
>  drivers/media/usb/tm6000/tm6000-dvb.c              | 11 ++++--
>  drivers/media/usb/tm6000/tm6000-video.c            | 13 ++++---
>  drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c  | 13 +++----
>  drivers/media/usb/ttusb-dec/ttusb_dec.c            | 43 ++++++++--------=
------
>  18 files changed, 171 insertions(+), 171 deletions(-)
>=20

<snip>

> diff --git a/drivers/media/platform/qcom/camss-8x16/camss-csid.c b/driver=
s/media/platform/qcom/camss-8x16/camss-csid.c
> index 64df82817de3..5c790d8c1f80 100644
> --- a/drivers/media/platform/qcom/camss-8x16/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss-8x16/camss-csid.c
> @@ -328,16 +328,12 @@ static int csid_set_power(struct v4l2_subdev *sd, i=
nt on)
>  			return ret;
> =20
>  		ret =3D csid_set_clock_rates(csid);
> -		if (ret < 0) {
> -			regulator_disable(csid->vdda);
> -			return ret;
> -		}
> +		if (ret < 0)
> +			goto disable_regulator;
> =20
>  		ret =3D camss_enable_clocks(csid->nclocks, csid->clock, dev);
> -		if (ret < 0) {
> -			regulator_disable(csid->vdda);
> -			return ret;
> -		}
> +		if (ret < 0)
> +			goto disable_regulator;
> =20
>  		enable_irq(csid->irq);
> =20
> @@ -345,8 +341,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int=
 on)
>  		if (ret < 0) {
>  			disable_irq(csid->irq);
>  			camss_disable_clocks(csid->nclocks, csid->clock);
> -			regulator_disable(csid->vdda);
> -			return ret;
> +			goto disable_regulator;
>  		}
> =20
>  		hw_version =3D readl_relaxed(csid->base + CAMSS_CSID_HW_VERSION);
> @@ -358,6 +353,10 @@ static int csid_set_power(struct v4l2_subdev *sd, in=
t on)
>  	}
> =20
>  	return ret;
> +
> +disable_regulator:
> +	regulator_disable(csid->vdda);
> +	return ret;
>  }
> =20

For the QComm CAMSS part of the patch:
Acked-by: Todor Tomov <todor.tomov@linaro.org>


--=20
Best regards,
Todor Tomov
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
