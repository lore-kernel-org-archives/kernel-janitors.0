From: Joe Perches <joe@perches.com>
Date: Sat, 04 Apr 2015 00:32:40 +0000
Subject: Re: [PATCH] staging: fbtft: 80 characters per line in fb_ili9163.c
Message-Id: <1428107560.2775.2.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1428106999-10067-1-git-send-email-andreasabu@gmail.com>
In-Reply-To: <1428106999-10067-1-git-send-email-andreasabu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Theodosiou <andreasabu@gmail.com>
Cc: thomas.petazzoni@free-electrons.com, noralf@tronnes.org, gregkh@linuxfoundation.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 2015-04-04 at 03:23 +0300, Andreas Theodosiou wrote:
> This is a patch to the fb_ili9163.c file that inserts a line break in
> line #92 to make the line fit into the 80 character limit.
[]
> diff --git a/drivers/staging/fbtft/fb_ili9163.c b/drivers/staging/fbtft/fb_ili9163.c
[]
> @@ -89,7 +89,8 @@
>  
>  /*
>  This display:
> -http://www.ebay.com/itm/Replace-Nokia-5110-LCD-1-44-Red-Serial-128X128-SPI-Color-TFT-LCD-Display-Module-/271422122271
> +http://www.ebay.com/itm/Replace-Nokia-5110-LCD-1-44-Red-Serial-128X128-SPI-
> +Color-TFT-LCD-Display-Module-/271422122271

Please don't do this to links.

There are many real defects to fix and other code to improve.

This isn't one of those.

I doubt though that an ebay link is very long lasting.


