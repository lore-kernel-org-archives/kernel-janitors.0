From: David Miller <davem@davemloft.net>
Date: Wed, 21 May 2014 20:43:03 +0000
Subject: Re: [PATCH] vxge: Use time_before()
Message-Id: <20140521.164303.1327740853923724994.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400520928.30820.23.camel@joe-AO725>
	<1400533144-8473-1-git-send-email-manuel.schoelling@gmx.de>
In-Reply-To: <1400533144-8473-1-git-send-email-manuel.schoelling@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: manuel.schoelling@gmx.de
Cc: jdmason@kudzu.us, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, joe@perches.com

From: Manuel Sch=F6lling <manuel.schoelling@gmx.de>
Date: Mon, 19 May 2014 22:59:04 +0200

> To be future-proof and for better readability the time comparisons are mo=
dified
> to use time_before() instead of plain, error-prone math.
>=20
> Signed-off-by: Manuel Sch=F6lling <manuel.schoelling@gmx.de>

Applied, thanks.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
