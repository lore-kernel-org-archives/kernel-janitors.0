From: walter harms <wharms@bfs.de>
Date: Mon, 01 Oct 2012 07:13:06 +0000
Subject: Re: [PATCH V2] ath/ath9k/ar9003_eeprom.c: Remove semicolon after if
Message-Id: <50694282.6060809@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 30.09.2012 22:56, schrieb Peter Senna Tschudin:
> The semantic patch that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @r1@
> position p;
> @@
> if (...);@p
> 
> @script:python@
> p0 << r1.p;
> @@
> // Emacs org-mode output
> cocci.print_main("", p0)
> cocci.print_secs("", p0)
> // </smpl>
> 
> Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
> ---
> NOTE: This patch changes the semantics.
> 
> Changes from V1:
> Commit message
> Added a note about semantics change
> 
>  drivers/net/wireless/ath/ath9k/ar9003_eeprom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath9k/ar9003_eeprom.c b/drivers/net/wireless/ath/ath9k/ar9003_eeprom.c
> index 5bbe505..189aeb2 100644
> --- a/drivers/net/wireless/ath/ath9k/ar9003_eeprom.c
> +++ b/drivers/net/wireless/ath/ath9k/ar9003_eeprom.c
> @@ -2989,7 +2989,7 @@ static u32 ath9k_hw_ar9300_get_eeprom(struct ath_hw *ah,
>  	case EEP_PAPRD:
>  		if (AR_SREV_9462(ah))
>  			return false;
> -		if (!ah->config.enable_paprd);
> +		if (!ah->config.enable_paprd)
>  			return false;
>  		return !!(pBase->featureEnable & BIT(5));
>  	case EEP_CHAIN_MASK_REDUCE:

Hi Peter,
please be a bit more verbose in your description.
This patch actualy changes the behavier of the code (into the intended way).
Something like "fix brocken error check" is much more appropiate.
There is clearly a difference between a additional (useless) semicolon
and things like this.

re,
 wh
