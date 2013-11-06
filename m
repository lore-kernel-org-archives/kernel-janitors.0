From: Sujith Manoharan <sujith@msujith.org>
Date: Wed, 06 Nov 2013 05:31:21 +0000
Subject: Re: [patch] ath9k: fix SC_OP_INVALID test in ath9k_tx99_init()
Message-Id: <21113.53593.471557.385898@gargle.gargle.HOWL>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131105202034.GC3949@elgon.mountain>
In-Reply-To: <20131105202034.GC3949@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, ath9k-devel@venema.h4ckr.net, kernel-janitors@vger.kernel.org

Dan Carpenter wrote:
> SC_OP_INVALID is zero so the test is always false.  We're supposed to be
> testing the lowest bit instead.
> 
> Fixes: 89f927af7f33 ('ath9k: add TX99 support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/net/wireless/ath/ath9k/main.c b/drivers/net/wireless/ath/ath9k/main.c
> index 74f452c..7ad4e11 100644
> --- a/drivers/net/wireless/ath/ath9k/main.c
> +++ b/drivers/net/wireless/ath/ath9k/main.c
> @@ -2456,7 +2456,7 @@ int ath9k_tx99_init(struct ath_softc *sc)
>  	struct ath_tx_control txctl;
>  	int r;
>  
> -	if (sc->sc_flags & SC_OP_INVALID) {
> +	if (test_bit(SC_OP_INVALID, &sc->sc_flags)) {
>  		ath_err(common,
>  			"driver is in invalid state unable to use TX99");
>  		return -EINVAL;

Nice catch.

The tx99 code in ath9k has been moved to a separate file, is it okay if I adopt
this patch and update it ?

Sujith
