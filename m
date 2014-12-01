From: Valentina Manea <valentina.manea.m@gmail.com>
Date: Mon, 01 Dec 2014 08:39:19 +0000
Subject: Re: [PATCH 4/4] usbip: remove unneeded structure
Message-Id: <CABdoFFem4O8X1R1-DBftpxaPSo83hcmhF-WGUjUGY_fUJjGEUg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1417371255-2282-1-git-send-email-Julia.Lawall@lip6.fr>
	<1417371255-2282-5-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1417371255-2282-5-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Shuah Khan <shuah.kh@samsung.com>, linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sun, Nov 30, 2014 at 8:14 PM, Julia Lawall <Julia.Lawall@lip6.fr> wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
>
> Delete a local structure that is only used to be initialized by memset.
>
> A semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
>
> // <smpl>
> @@
> identifier x,i;
> @@
>
> {
> ... when any
> -struct i x;
> <+... when != x
> - memset(&x,...);
> ...+>
> }
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>
> ---
>  tools/usb/usbip/src/usbipd.c |    2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/tools/usb/usbip/src/usbipd.c b/tools/usb/usbip/src/usbipd.c
> index 2f87f2d..2a7cd2b 100644
> --- a/tools/usb/usbip/src/usbipd.c
> +++ b/tools/usb/usbip/src/usbipd.c
> @@ -91,7 +91,6 @@ static void usbipd_help(void)
>  static int recv_request_import(int sockfd)
>  {
>         struct op_import_request req;
> -       struct op_common reply;
>         struct usbip_exported_device *edev;
>         struct usbip_usb_device pdu_udev;
>         struct list_head *i;
> @@ -100,7 +99,6 @@ static int recv_request_import(int sockfd)
>         int rc;
>
>         memset(&req, 0, sizeof(req));
> -       memset(&reply, 0, sizeof(reply));
>
>         rc = usbip_net_recv(sockfd, &req, sizeof(req));
>         if (rc < 0) {
>

Acked-by: Valentina Manea <valentina.manea.m@gmail.com>
