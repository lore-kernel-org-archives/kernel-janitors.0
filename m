From: Andrew Lunn <andrew@lunn.ch>
Date: Thu, 15 Feb 2018 20:27:57 +0000
Subject: Re: [PATCH][next] net: dsa: mv88e6xxx: avoid unintended sign extension on a 16 bit shift
Message-Id: <20180215202757.GB3080@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180215191218.27936-1-colin.king@canonical.com>
In-Reply-To: <20180215191218.27936-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: richardcochran@gmail.com
Cc: Vivien Didelot <vivien.didelot@savoirfairelinux.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

> diff --git a/drivers/net/dsa/mv88e6xxx/hwtstamp.c b/drivers/net/dsa/mv88e6xxx/hwtstamp.c
> index b251d534b70d..758e35fa69ab 100644
> --- a/drivers/net/dsa/mv88e6xxx/hwtstamp.c
> +++ b/drivers/net/dsa/mv88e6xxx/hwtstamp.c
> @@ -321,7 +321,7 @@ static void mv88e6xxx_get_rxts(struct mv88e6xxx_chip *chip,
>  	 */
>  	for ( ; skb; skb = skb_dequeue(rxq)) {
>  		if (mv88e6xxx_ts_valid(status) && seq_match(skb, seq_id)) {
> -			u64 ns = timehi << 16 | timelo;
> +			u64 ns = (u64)timehi << 16 | timelo;

Hi Richard

Do you prefer this, or making timehi and timelo a u64?

   Andrew
