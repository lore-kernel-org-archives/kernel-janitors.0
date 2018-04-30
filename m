From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Date: Mon, 30 Apr 2018 14:44:31 +0000
Subject: RE: [PATCH] typec: tcpm: Fix incorrect 'and' operator
Message-Id: <2E89032DDAA8B9408CB92943514A0337014C1E9323@SW-EX-MBX01.diasemi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180430132305.GA20092@embeddedor.com>
In-Reply-To: <20180430132305.GA20092@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On 30 April 2018 14:23, Gustavo A. R. Silva wrote:

> Currently, logical and is being used instead of *bitwise* and.
> 
> Fix this by using a proper bitwise and operator.
> 
> Addresses-Coverity-ID: 1468455 ("Logical vs. bitwise operator")
> Fixes: 64f7c494a3c0 ("typec: tcpm: Add support for sink PPS related
> messages")
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---

Good spot. :(

Acked-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

>  drivers/usb/typec/tcpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm.c b/drivers/usb/typec/tcpm.c
> index 1ee259b..7ee417a 100644
> --- a/drivers/usb/typec/tcpm.c
> +++ b/drivers/usb/typec/tcpm.c
> @@ -1772,7 +1772,7 @@ static void tcpm_pd_ext_msg_request(struct tcpm_port
> *port,
>  	enum pd_ext_msg_type type = pd_header_type_le(msg->header);
>  	unsigned int data_size = pd_ext_header_data_size_le(msg-
> >ext_msg.header);
> 
> -	if (!(msg->ext_msg.header && PD_EXT_HDR_CHUNKED)) {
> +	if (!(msg->ext_msg.header & PD_EXT_HDR_CHUNKED)) {
>  		tcpm_log(port, "Unchunked extended messages unsupported");
>  		return;
>  	}
> --
> 2.7.4
