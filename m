From: Jim Davis <jim.epost@gmail.com>
Date: Fri, 23 Jan 2015 19:45:14 +0000
Subject: Re: [patch] staging: fbtft: fix allyesconfig build
Message-Id: <CA+r1Zhhy4E8L-4T5U8DZCSixLCRCT1V4wj+WuJj-JJx+Fw_FMA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150123142025.GA9974@mwanda>
In-Reply-To: <20150123142025.GA9974@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jan 23, 2015 at 7:20 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> There are two functions call reset() so the allyesconfig breaks.  Let's
> make this one static.
>
> Reported-by: Jim Davis <jim.epost@gmail.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Hi Jim, can you test this patch and see if it fixes the build issue?
>
> diff --git a/drivers/staging/fbtft/fb_agm1264k-fl.c b/drivers/staging/fbtft/fb_agm1264k-fl.c
> index 7fe4fa0..9cc7d25 100644
> --- a/drivers/staging/fbtft/fb_agm1264k-fl.c
> +++ b/drivers/staging/fbtft/fb_agm1264k-fl.c
> @@ -89,7 +89,7 @@ static int init_display(struct fbtft_par *par)
>         return 0;
>  }
>
> -void reset(struct fbtft_par *par)
> +static void reset(struct fbtft_par *par)
>  {
>         if (par->gpio.reset = -1)
>                 return;
> --

Looks good -- make allyesconfig with next-20150123 builds cleanly with
that patch.  Thanks!

Tested-by: Jim Davis <jim.epost@gmail.com>
