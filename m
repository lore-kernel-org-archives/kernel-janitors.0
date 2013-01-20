From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Sun, 20 Jan 2013 21:01:33 +0000
Subject: Re: [patch v3] b43: N-PHY: fix gain in b43_nphy_get_gain_ctl_workaround_ent()
Message-Id: <CACna6ryF=3y8cNxLSnpbWbuQjAp3PZO5k2BxOGFC9H7d+aXz8A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <AE90C24D6B3A694183C094C60CF0A2F6026B7118@saturn3.aculab.com>
	<20130120163130.GA7730@elgon.mountain>
In-Reply-To: <20130120163130.GA7730@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stefano Brivio <stefano.brivio@polimi.it>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, b43-dev@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, David Laight <David.Laight@aculab.com>, kernel-janitors@vger.kernel.org

2013/1/20 Dan Carpenter <dan.carpenter@oracle.com>:
> There were no break statements in this switch statement so everything
> used the default settings.  Per Walter Harms's suggestion, I've replaced
> the switch statement and done a little cleanup.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: Make additional style fixes as well while we're messing with the
>     function.
> v3: Make the array static const int.

Looks fine, thanks Dan

--=20
Rafa=C5=82
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
