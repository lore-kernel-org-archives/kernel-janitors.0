From: Joe Perches <joe@perches.com>
Date: Sun, 20 Dec 2015 18:47:08 +0000
Subject: Re: [patch -next] ath9k: fix ath9k_hw_nvram_check_version()
Message-Id: <1450637228.3430.30.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151219105919.GB3749@mwanda>
In-Reply-To: <20151219105919.GB3749@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, ath9k-devel@venema.h4ckr.net, kernel-janitors@vger.kernel.org

On Sat, 2015-12-19 at 13:59 +0300, Dan Carpenter wrote:
> There is a type bug so it always returns success.

How many false positives do you have to sift
through to find this sort of error?

> +++ b/drivers/net/wireless/ath/ath9k/eeprom.c
> @@ -206,7 +206,7 @@ bool ath9k_hw_nvram_check_version(struct ath_hw *ah, =
int version, int minrev)
> =A0		ath_err(common, "Bad EEPROM VER 0x%04x or REV 0x%04x\n",
> =A0			ah->eep_ops->get_eeprom_ver(ah),
> =A0			ah->eep_ops->get_eeprom_rev(ah));
> -		return -EINVAL;
> +		return false;
> =A0	}
> =A0
> =A0	return true;

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
