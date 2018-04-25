From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 25 Apr 2018 12:37:26 +0000
Subject: Re: [PATCH] mmc: sdhci-cadence: Fix a loop in sdhci_cdns_set_tune_val()
Message-Id: <CAK7LNARHSg3hAGdHy3BcxnDD3rdf14vQT8wbTM1-mrgwE-_4PA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180424132606.GA10167@mwanda>
In-Reply-To: <20180424132606.GA10167@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

2018-04-24 22:26 GMT+09:00 Dan Carpenter <dan.carpenter@oracle.com>:
> We were supposed to go through this loop twice but there is a missing if
> statement so it only loops once.
>
> Fixes: 213fae74318b ("mmc: sdhci-cadence: send tune request twice to work around errata")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>


Thanks for the fix, but
an equivalent patch had already been applied.

https://patchwork.kernel.org/patch/10351215/



> diff --git a/drivers/mmc/host/sdhci-cadence.c b/drivers/mmc/host/sdhci-cadence.c
> index bc30d1637246..7a343b87b5e5 100644
> --- a/drivers/mmc/host/sdhci-cadence.c
> +++ b/drivers/mmc/host/sdhci-cadence.c
> @@ -274,8 +274,8 @@ static int sdhci_cdns_set_tune_val(struct sdhci_host *host, unsigned int val)
>                 ret = readl_poll_timeout(reg, tmp,
>                                          !(tmp & SDHCI_CDNS_HRS06_TUNE_UP),
>                                          0, 1);
> -
> -               return ret;
> +               if (ret)
> +                       return ret;
>         }
>
>         return 0;
> --
> To unsubscribe from this list: send the line "unsubscribe linux-mmc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
