From: Minas Harutyunyan <minas.harutyunyan@synopsys.com>
Date: Mon, 24 Sep 2018 05:48:33 +0000
Subject: Re: [PATCH] usb: dwc2: remove set but unused variable
Message-Id: <410670D7E743164D87FA6160E7907A56013A76F5B9@am04wembxa.internal.synopsys.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180912181610.GA31006@josh-ThinkPad-T460s>
In-Reply-To: <20180912181610.GA31006@josh-ThinkPad-T460s>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Josh Abraham <j.abraham1776@gmail.com>, "minas.harutyunyan@synopsys.com" <minas.harutyunyan@synopsys.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On 9/24/2018 5:41 AM, Josh Abraham wrote:
> This patch removes a set but unused variable in hcd.c.
>=20
> Fixes gcc warning:
> variable =91data_fifo=92 set but not used [-Wunused-but-set-variable]
>=20
> Signed-off-by: Joshua Abraham <j.abraham1776@gmail.com>
> ---
>   drivers/usb/dwc2/hcd.c | 3 ---
>   1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
> index 2bd6e6bfc241..5f23b933cafc 100644
> --- a/drivers/usb/dwc2/hcd.c
> +++ b/drivers/usb/dwc2/hcd.c
> @@ -1328,14 +1328,11 @@ static void dwc2_hc_write_packet(struct dwc2_hsot=
g *hsotg,
>   	u32 remaining_count;
>   	u32 byte_count;
>   	u32 dword_count;
> -	u32 __iomem *data_fifo;
>   	u32 *data_buf =3D (u32 *)chan->xfer_buf;
>  =20
>   	if (dbg_hc(chan))
>   		dev_vdbg(hsotg->dev, "%s()\n", __func__);
>  =20
> -	data_fifo =3D (u32 __iomem *)(hsotg->regs + HCFIFO(chan->hc_num));
> -
>   	remaining_count =3D chan->xfer_len - chan->xfer_count;
>   	if (remaining_count > chan->max_packet)
>   		byte_count =3D chan->max_packet;
>=20
Acked-by: Minas Harutyunyan <hminas@synopsys.com>
