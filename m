From: David Miller <davem@davemloft.net>
Date: Mon, 19 May 2014 01:25:27 +0000
Subject: Re: [PATCH] net: rds: Use time_after() for time comparison
Message-Id: <20140518.212527.1931788955169993316.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400448769-5945-1-git-send-email-manuel.schoelling@gmx.de>
In-Reply-To: <1400448769-5945-1-git-send-email-manuel.schoelling@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: manuel.schoelling@gmx.de
Cc: chien.yen@oracle.com, rds-devel@oss.oracle.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Manuel Sch=F6lling <manuel.schoelling@gmx.de>
Date: Sun, 18 May 2014 23:32:49 +0200

> To be future-proof and for better readability the time comparisons are mo=
dified
> to use time_after() instead of raw math.
>=20
> Signed-off-by: Manuel Sch=F6lling <manuel.schoelling@gmx.de>

Applied.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
