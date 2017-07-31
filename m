From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Date: Mon, 31 Jul 2017 07:07:18 +0000
Subject: RE: [PATCH 06/11] usb: renesas_usbhs: constify hc_driver structures
Message-Id: <TY1PR06MB09923353E732DEB7B94E462DD8B20@TY1PR06MB0992.apcprd06.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1501274518-25170-1-git-send-email-Julia.Lawall@lip6.fr>
 <1501274518-25170-7-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1501274518-25170-7-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi,

> From: Julia Lawall
> Sent: Saturday, July 29, 2017 5:42 AM
> 
> The hc_driver structure is only passed as the first argument to
> usb_create_hcd, which is declared as const.  Thus the hc_driver structure
> itself can be const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Thank you for the patch!

Acked-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

