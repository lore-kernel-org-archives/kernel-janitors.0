From: =?UTF-8?Q?Sjur_Br=C3=A6ndeland?= <sjurbren@gmail.com>
Date: Mon, 24 May 2010 20:47:41 +0000
Subject: Re: [patch v2] caif: cleanup: remove duplicate checks
Message-Id: <AANLkTilHv7m-oJSlXHJRLT9BLKscGLSFnGVCOB9U0kic@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100522204519.GW22515@bicker> <4BF8E6FE.9000303@bfs.de>
	 <20100524162815.GA22515@bicker>
In-Reply-To: <20100524162815.GA22515@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <error27@gmail.com>
Cc: walter harms <wharms@bfs.de>, netdev@vger.kernel.org, Sjur Braendeland <sjur.brandeland@stericsson.com>, Stephen Rothwell <sfr@canb.auug.org.au>, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

 Dan Carpenter <error27@gmail.com> wrote:
> "phyinfo" can never be null here because we assigned it an address, so I
> removed both the assert and the second check inside the if statement. =C2=
=A0I
> removed the "phyinfo->phy_layer !=3D NULL" check as well because that was
> asserted earlier.
>
> Walter Harms suggested I move the "phyinfo->phy_ref_count++;" outside
> the if condition for readability, so I have done that.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
Acked-by: Sjur Braendeland <sjur.brandeland@stericsson.com>
Thanks, this looks good.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
