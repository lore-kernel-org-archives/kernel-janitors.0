From: =?ISO-8859-1?Q?Sjur_Br=E6ndeland?= <sjurbren@gmail.com>
Date: Sat, 15 May 2010 22:54:17 +0000
Subject: Re: [PATCH 13/20] net/caif: Use kzalloc
Message-Id: <AANLkTim4uGaZ_RDawZSrjWybdZc60_oSl1s45qrmVn--@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005132203150.6282@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005132203150.6282@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <julia@diku.dk>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall <julia@diku.dk> wrote:
>Use kzalloc rather than the combination of kmalloc and memset.

Thank you, this look good to me.
Acked-by: Sjur Br=E6ndeland <sjur.brandeland@stericsson.com>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
