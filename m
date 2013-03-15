From: Ian Abbott <abbotti@mev.co.uk>
Date: Fri, 15 Mar 2013 09:41:05 +0000
Subject: Re: [PATCH] staging: comedi: drivers: ni_atmio.c: Add a missing semicolon
Message-Id: <5142ECB1.306@mev.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1363335269-14903-1-git-send-email-gmate.amit@gmail.com>
In-Reply-To: <1363335269-14903-1-git-send-email-gmate.amit@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar Amit Mehta <gmate.amit@gmail.com>
Cc: Ian Abbott <ian.abbott@mev.co.uk>, "fmhess@users.sourceforge.net" <fmhess@users.sourceforge.net>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "hsweeten@visionengravers.com" <hsweeten@visionengravers.com>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 2013-03-15 08:14, Kumar Amit Mehta wrote:
> fix a missing end-of-statement by adding a semicolon.
>
> Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>
> ---
>   drivers/staging/comedi/drivers/ni_atmio.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/comedi/drivers/ni_atmio.c b/drivers/staging/comedi/drivers/ni_atmio.c
> index 279f2cd..37372a1 100644
> --- a/drivers/staging/comedi/drivers/ni_atmio.c
> +++ b/drivers/staging/comedi/drivers/ni_atmio.c
> @@ -467,7 +467,7 @@ static int ni_atmio_attach(struct comedi_device *dev,
>   		return -EIO;
>
>   	dev->board_ptr = ni_boards + board;
> -	boardtype = comedi_board(dev)
> +	boardtype = comedi_board(dev);
>
>   	printk(" %s", boardtype->name);
>   	dev->board_name = boardtype->name;

Ironically, that was introduced by a patch titled "staging: comedi: 
ni_atmio: fix build errors". :-)

-- 
-=( Ian Abbott @ MEV Ltd.    E-mail: <abbotti@mev.co.uk>        )=-
-=( Tel: +44 (0)161 477 1898   FAX: +44 (0)161 718 3587         )=-
