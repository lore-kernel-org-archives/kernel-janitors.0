From: =?ISO-8859-2?Q?Giedrius_Statkevi=E8ius?=  <giedrius.statkevicius@gmail.com>
Date: Sat, 04 Apr 2015 01:12:05 +0000
Subject: Re: [PATCH] staging: fbtft: 80 characters per line in fb_ili9163.c
Message-Id: <alpine.LNX.2.03.1504040410110.8954@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1428106999-10067-1-git-send-email-andreasabu@gmail.com>
In-Reply-To: <1428106999-10067-1-git-send-email-andreasabu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Theodosiou <andreasabu@gmail.com>
Cc: thomas.petazzoni@free-electrons.com, noralf@tronnes.org, gregkh@linuxfoundation.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 4 Apr 2015, Andreas Theodosiou wrote:

> This is a patch to the fb_ili9163.c file that inserts a line break in
> line #92 to make the line fit into the 80 character limit.
> 
> Signed-off-by: Andreas Theodosiou <andreasabu@gmail.com>
> ---
>  drivers/staging/fbtft/fb_ili9163.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/fbtft/fb_ili9163.c b/drivers/staging/fbtft/fb_ili9163.c
> index ed92a64..fc7568b 100644
> --- a/drivers/staging/fbtft/fb_ili9163.c
> +++ b/drivers/staging/fbtft/fb_ili9163.c
> @@ -89,7 +89,8 @@
>  
>  /*
>  This display:
> -http://www.ebay.com/itm/Replace-Nokia-5110-LCD-1-44-Red-Serial-128X128-SPI-Color-TFT-LCD-Display-Module-/271422122271
> +http://www.ebay.com/itm/Replace-Nokia-5110-LCD-1-44-Red-Serial-128X128-SPI-
> +Color-TFT-LCD-Display-Module-/271422122271

With this change the user won't be able to just simply click on the url and have
it open for him. Thus I don't think this is a good change. Sometimes in the
kernel people leave lines over 80 characters to make the code more grep-able,
sometimes it's just more clear when it's over 80 characters or, probably, in
cases like this.

Su pagarba / Regards,
Giedrius
