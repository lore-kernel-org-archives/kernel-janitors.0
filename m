From: David Miller <davem@davemloft.net>
Date: Thu, 22 May 2014 19:51:02 +0000
Subject: Re: [PATCH] xilinx: Use time_before_eq()
Message-Id: <20140522.155102.429779731290445105.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400785828-1551-1-git-send-email-manuel.schoelling@gmx.de>
In-Reply-To: <1400785828-1551-1-git-send-email-manuel.schoelling@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

From: Manuel Sch=F6lling <manuel.schoelling@gmx.de>
Date: Thu, 22 May 2014 21:10:28 +0200

> To be future-proof and for better readability the time comparisons are mo=
dified
> to use time_before_eq() instead of plain, error-prone math.
>=20
> Signed-off-by: Manuel Sch=F6lling <manuel.schoelling@gmx.de>

Applied.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
