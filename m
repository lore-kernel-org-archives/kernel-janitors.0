From: walter harms <wharms@bfs.de>
Date: Wed, 29 Nov 2017 08:15:10 +0000
Subject: Re: [PATCH] drivers/staging/rtl8188eu remove 5GHZ specific code
Message-Id: <5A1E6C8E.7040006@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1511929927.23129.16.camel@gmail.com>
In-Reply-To: <1511929927.23129.16.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 29.11.2017 05:32, schrieb Travis Davies:
> [PATCH] drivers/staging/rtl8188eu remove 5GHZ specific code
> 
> My first patch.
> This based from linux-next tree.
> Removes code valid only for 5 HGz, as per the TODO, and also some formating issues.
> If this device is only supported for sub 5GHZ hardware than this
> change should not harm its intended audience. The caller 
> of Hal_GetChnlGroup88E() does not check for false.
> 
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
> +       else if (chnl < 6)              /*  Channel 3-5 */
> +               *pGroup = 1;
> +       else if (chnl < 9)              /*  Channel 6-8 */
> +               *pGroup = 2;
> +       else if (chnl < 12)             /*  Channel 9-11 */
> +               *pGroup = 3;
> +       else if (chnl < 14)             /*  Channel 12-13 */
> +               *pGroup = 4;
> +       else if (chnl = 14)            /*  Channel 14 */
> +               *pGroup = 5;
> +
> +       return true;
>  }
>  

I suggest a *pGroup = 0 at the beginning. Otherwise *pGroup will return
uninitilised memory and true.
What means it should have an "else return false;" also. Or make the whole
thing void.


>  void Hal_ReadPowerSavingMode88E(struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail)
> @@ -486,13 +449,13 @@ void Hal_ReadTxPowerInfo88E(struct adapter *padapter, u8 *PROMContent, bool Auto
>                                 pHalData->Index24G_BW40_Base[0][ch] = pwrInfo24G.IndexBW40_Base[0][4];
>                         else
>                                 pHalData->Index24G_BW40_Base[0][ch] = pwrInfo24G.IndexBW40_Base[0][group];
> -               }
> -               if (bIn24G) {
> +
>                         DBG_88E("==== Path %d, Channel %d ====\n", 0, ch);
>                         DBG_88E("Index24G_CCK_Base[%d][%d] = 0x%x\n", 0, ch, pHalData->Index24G_CCK_Base[0][ch]);
>                         DBG_88E("Index24G_BW40_Base[%d][%d] = 0x%x\n", 0, ch, pHalData->Index24G_BW40_Base[0][ch]);
>                 }
>         }
> +
>         for (TxCount = 0; TxCount < MAX_TX_COUNT; TxCount++) {
>                 pHalData->CCK_24G_Diff[0][TxCount] = pwrInfo24G.CCK_Diff[0][TxCount];
>                 pHalData->OFDM_24G_Diff[0][TxCount] = pwrInfo24G.OFDM_Diff[0][TxCount];
> 
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
