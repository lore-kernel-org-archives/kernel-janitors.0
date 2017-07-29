From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 29 Jul 2017 10:59:53 +0000
Subject: Re: [PATCH 1/1][staging-next] staging: pi433: Make functions rf69_set_dc_cut_off_frequency_intern st
Message-Id: <20170729105953.alvtnmjgw7g53cng@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170718130400.25436-1-colin.king@canonical.com>
 <20170718130400.25436-2-colin.king@canonical.com>
 <294e80854a10c63451cf3e9d7ca02bce-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAhaW34EVVM=-webmailer1@server01.webmailer.webmailer.hosteurope.de>
 <20170729000043.GA28803@kroah.com>
 <1370919182.11119.1501319363782@ox.hosteurope.de>
In-Reply-To: <1370919182.11119.1501319363782@ox.hosteurope.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcus Wolf <marcus.wolf@wolf-entwicklungen.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, Colin King <colin.king@canonical.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Jul 29, 2017 at 11:09:23AM +0200, Marcus Wolf wrote:
> Hi Greg,
>  
> also had a very close look to this patch. Even in your reply I can't find any
> problems with line wraps or other corruptions :-/
> 

Here are the relevant lines from Greg's email:

> +++ b/drivers/staging/pi433/rf69.c
> @@ -221,7 +221,7 @@ int rf69_set_frequency(struct spi_device *spi, u32
> frequency)

The "frequency)" bit is supposed to be on the line before.

regards,
dan carpenter
