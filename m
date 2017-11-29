From: Greg KH <gregkh@linuxfoundation.org>
Date: Wed, 29 Nov 2017 09:42:01 +0000
Subject: Re: [PATCH] drivers/staging/rtl8188eu remove 5GHZ specific code
Message-Id: <20171129094201.GB7597@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1511929927.23129.16.camel@gmail.com>
In-Reply-To: <1511929927.23129.16.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Travis Davies <travisdavies.linuxkernel@gmail.com>
Cc: Larry.Finger@lwfinger.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Nov 28, 2017 at 08:32:07PM -0800, Travis Davies wrote:
> [PATCH] drivers/staging/rtl8188eu remove 5GHZ specific code

That is up in the subject line, no need to put it in the body.

> My first patch.

No need for that in the changelog :)

> This based from linux-next tree.

Nor that :)

> Removes code valid only for 5 HGz, as per the TODO, and also some formating issues.

But this line isn't formatted properly :(

> If this device is only supported for sub 5GHZ hardware than this
> change should not harm its intended audience. The caller 
> of Hal_GetChnlGroup88E() does not check for false.

Were you able to test this?

> Signed-off-by: Travis Davies <travisdavies.linuxkernel@gmail.com>
> 
> 
> diff --git a/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
> index 3673f57..28c31e3 100644
> --- a/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
> +++ b/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
> @@ -387,59 +387,22 @@ static void Hal_ReadPowerValueFromPROM_8188E(struct txpowerinfo24g *pwrInfo24G,
>         }
>  }
>  
> -static u8 Hal_GetChnlGroup88E(u8 chnl, u8 *pGroup)
> -{
> -       u8 bIn24G = true;
> -
> -       if (chnl <= 14) {
> -               bIn24G = true;
> -
> -               if (chnl < 3)                   /*  Channel 1-2 */
> -                       *pGroup = 0;
> -               else if (chnl < 6)              /*  Channel 3-5 */
> -                       *pGroup = 1;
> -               else     if (chnl < 9)          /*  Channel 6-8 */
> -                       *pGroup = 2;
> -               else if (chnl < 12)             /*  Channel 9-11 */
> -                       *pGroup = 3;
> -               else if (chnl < 14)             /*  Channel 12-13 */
> -                       *pGroup = 4;
> -               else if (chnl = 14)            /*  Channel 14 */
> -                       *pGroup = 5;
> -       } else {
> -
> -               /* probably, this branch is suitable only for 5 GHz */
> -
> -               bIn24G = false;
> -
> -               if (chnl <= 40)
> -                       *pGroup = 0;
> -               else if (chnl <= 48)
> -                       *pGroup = 1;
> -               else     if (chnl <= 56)
> -                       *pGroup = 2;
> -               else if (chnl <= 64)
> -                       *pGroup = 3;
> -               else if (chnl <= 104)
> -                       *pGroup = 4;
> -               else if (chnl <= 112)
> -                       *pGroup = 5;
> -               else if (chnl <= 120)
> -                       *pGroup = 5;
> -               else if (chnl <= 128)
> -                       *pGroup = 6;
> -               else if (chnl <= 136)
> -                       *pGroup = 7;
> -               else if (chnl <= 144)
> -                       *pGroup = 8;
> -               else if (chnl <= 153)
> -                       *pGroup = 9;
> -               else if (chnl <= 161)
> -                       *pGroup = 10;
> -               else if (chnl <= 177)
> -                       *pGroup = 11;
> -       }
> -       return bIn24G;
> +static u8 Hal_GetChnlGroup88E(u8 chnl, u8 *pGroup) {
> +
> +        if (chnl < 3)                  /*  Channel 1-2 */
> +               *pGroup = 0;

No tabs?

Please always run scripts/checkpatch.pl on your patches.

thanks,

greg k-h
