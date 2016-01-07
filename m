From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Date: Thu, 07 Jan 2016 07:03:07 +0000
Subject: RE: [PATCH] usb: renesas_usbhs: constify usbhs_pkt_handle structures
Message-Id: <SG2PR06MB0919E199F0B836E624EFC07DD8F50@SG2PR06MB0919.apcprd06.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1451249429-17205-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1451249429-17205-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Julia,

> From: linux-usb-owner@vger.kernel.org [mailto:linux-usb-owner@vger.kernel.org] On Behalf Of Julia Lawall
> Sent: Monday, December 28, 2015 5:50 AM
> 
> The usbhs_pkt_handle structures are never modified, so declare them as
> const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Thank you for the patch!

Acked-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

