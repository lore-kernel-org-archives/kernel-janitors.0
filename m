From: Alan Stern <stern@rowland.harvard.edu>
Date: Wed, 13 Sep 2017 03:31:10 +0000
Subject: Re: [PATCH] usb: storage: make const arrays static, reduces object code size
Message-Id: <Pine.LNX.4.44L0.1709122330590.6689-100000@netrider.rowland.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20170912113835.1910-1-colin.king@canonical.com>
References: <20170912113835.1910-1-colin.king@canonical.com>
In-Reply-To: <20170912113835.1910-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 12 Sep 2017, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate const arrays on the stack, instead make them
> static.  Makes the object code smaller by over 1070 bytes:
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>    3505	    880	      0	   4385	   1121	drivers/usb/storage/option_ms.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>    2269	   1040	      0	   3309	    ced	drivers/usb/storage/option_ms.o
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/usb/storage/option_ms.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/storage/option_ms.c b/drivers/usb/storage/option_ms.c
> index 57282f12317b..4a73cd4783ae 100644
> --- a/drivers/usb/storage/option_ms.c
> +++ b/drivers/usb/storage/option_ms.c
> @@ -41,7 +41,7 @@ MODULE_PARM_DESC(option_zero_cd, "ZeroCD mode (1=Force Modem (default),"
>  
>  static int option_rezero(struct us_data *us)
>  {
> -	const unsigned char rezero_msg[] = {
> +	static const unsigned char rezero_msg[] = {
>  	  0x55, 0x53, 0x42, 0x43, 0x78, 0x56, 0x34, 0x12,
>  	  0x01, 0x00, 0x00, 0x00, 0x80, 0x00, 0x06, 0x01,
>  	  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> @@ -87,7 +87,7 @@ static int option_rezero(struct us_data *us)
>  
>  static int option_inquiry(struct us_data *us)
>  {
> -	const unsigned char inquiry_msg[] = {
> +	static const unsigned char inquiry_msg[] = {
>  	  0x55, 0x53, 0x42, 0x43, 0x12, 0x34, 0x56, 0x78,
>  	  0x24, 0x00, 0x00, 0x00, 0x80, 0x00, 0x06, 0x12,
>  	  0x00, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00, 0x00,

Acked-by: Alan Stern <stern@rowland.harvard.edu>

