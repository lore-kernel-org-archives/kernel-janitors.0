From: Hannes Eder <hannes@hanneseder.net>
Date: Fri, 27 Feb 2009 01:04:31 +0000
Subject: Re: [PATCH 09/16] usb host: fix sparse warning: Using plain integer
Message-Id: <154e089b0902261704j8dba825q59411db576a157e8@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221235706.17557.97714.stgit@vmbox.hanneseder.net>
	 <20090222000257.17557.27546.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090222000257.17557.27546.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: trivial@kernel.org, Greg Kroah-Hartman <gregkh@suse.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

[Added To]

On Sun, Feb 22, 2009 at 1:04 AM, Hannes Eder <hannes@hanneseder.net> wrote:
> Fix this sparse warning:
> =A0drivers/usb/host/oxu210hp-hcd.c:2687:42: warning: Using plain integer =
as NULL pointer
>
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>
> ---
> =A0drivers/usb/host/oxu210hp-hcd.c | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/usb/host/oxu210hp-hcd.c b/drivers/usb/host/oxu210hp-=
hcd.c
> index 2947c69..5ac489e 100644
> --- a/drivers/usb/host/oxu210hp-hcd.c
> +++ b/drivers/usb/host/oxu210hp-hcd.c
> @@ -2684,7 +2684,7 @@ static int oxu_reset(struct usb_hcd *hcd)
> =A0 =A0 =A0 =A0oxu->urb_len =3D 0;
>
> =A0 =A0 =A0 =A0/* FIMXE */
> - =A0 =A0 =A0 hcd->self.controller->dma_mask =3D 0UL;
> + =A0 =A0 =A0 hcd->self.controller->dma_mask =3D NULL;
>
> =A0 =A0 =A0 =A0if (oxu->is_otg) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0oxu->caps =3D hcd->regs + OXU_OTG_CAP_OFFS=
ET;
>
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
