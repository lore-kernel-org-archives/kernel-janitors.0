From: Felix Fietkau <nbd@openwrt.org>
Date: Tue, 10 Apr 2012 09:58:26 +0000
Subject: Re: [ath9k-devel] [RFC] ath9k_hw: precedence bug in ath9k_hw_set_ofdm_nil()
Message-Id: <4F840442.5060706@openwrt.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120410090445.GB26832@elgon.mountain>
In-Reply-To: <20120410090445.GB26832@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Luis R. Rodriguez" <mcgrof@qca.qualcomm.com>, Rajkumar Manoharan <rmanohar@qca.qualcomm.com>, Vasanthakumar Thiagarajan <vthiagar@qca.qualcomm.com>, ath9k-devel@venema.h4ckr.net, kernel-janitors@vger.kernel.org, Jouni Malinen <jouni@qca.qualcomm.com>, linux-wireless@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>, Senthil Balasubramanian <senthilb@qca.qualcomm.com>

On 2012-04-10 11:04 AM, Dan Carpenter wrote:
> This was introduced in 54da20d83f "ath9k_hw: improve ANI processing and
> rx desensitizing parameters".  It triggers a Smatch complaint because
> the "if (!x != y) { ..." formation is a common precedence error.
> 
> In this case, maybe the code was intended to be as it is.  The
> "->ofdmWeakSigDetectOff" and "->ofdm_weak_signal_on" variables are both
> boolean.
> 
> Or perhaps based we could change the != to an = and remove the negate?
> 
> But normally when I see this formation it is a precedence bug so that's
> the patch I've sent.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/net/wireless/ath/ath9k/ani.c b/drivers/net/wireless/ath/ath9k/ani.c
> index 47a9fb4..8304e27 100644
> --- a/drivers/net/wireless/ath/ath9k/ani.c
> +++ b/drivers/net/wireless/ath/ath9k/ani.c
> @@ -291,7 +291,7 @@ static void ath9k_hw_set_ofdm_nil(struct ath_hw *ah, u8 immunityLevel)
>  				     entry_ofdm->fir_step_level);
>  
>  	if ((aniState->noiseFloor >= aniState->rssiThrHigh) &&
> -	    (!aniState->ofdmWeakSigDetectOff !> +	    (aniState->ofdmWeakSigDetectOff !Looking at other Atheros code, I think this patch is wrong, it should
be: aniState->ofdmWeakSigDetectOff = entry_ofdm->ofdm_weak_signal_on

While a bit confusing, the behavior of the original code was correct,
aniState->ofdmWeakSigDetectOff is used as a boolean.

This code badly needs a cleanup, the whole mess with *on vs *off
variables is quite confusing.

- Felix
