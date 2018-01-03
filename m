From: Antoine Tenart <antoine.tenart@free-electrons.com>
Date: Wed, 03 Jan 2018 08:38:11 +0000
Subject: Re: [PATCH][crypto-next] crypto: inside-secure - make function safexcel_try_push_requests static
Message-Id: <20180103083811.GA21727@kwain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180102143410.13261-1-colin.king@canonical.com>
In-Reply-To: <20180102143410.13261-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

On Tue, Jan 02, 2018 at 02:34:10PM +0000, Colin King wrote:
> =20
>  /* Called with ring's lock taken */
> -int safexcel_try_push_requests(struct safexcel_crypto_priv *priv, int ri=
ng,
> -			       int reqs)
> +static int safexcel_try_push_requests(struct safexcel_crypto_priv *priv,
> +				     int ring, int reqs)

Alignment should match open parenthesis, one space is missing. Otherwise,
looks good to me.

Thanks!
Antoine

--=20
Antoine T=E9nart, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
