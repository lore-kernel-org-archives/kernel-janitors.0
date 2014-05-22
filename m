From: David Miller <davem@davemloft.net>
Date: Thu, 22 May 2014 19:50:37 +0000
Subject: Re: [PATCH] qlogic: Use time_before()
Message-Id: <20140522.155037.86665103961019708.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400693043-15786-1-git-send-email-manuel.schoelling@gmx.de>
In-Reply-To: <1400693043-15786-1-git-send-email-manuel.schoelling@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: manuel.schoelling@gmx.de
Cc: shahed.shaikh@qlogic.com, Dept-HSGLinuxNICDev@qlogic.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Manuel Sch=F6lling <manuel.schoelling@gmx.de>
Date: Wed, 21 May 2014 19:24:03 +0200

> To be future-proof and for better readability the time comparisons are mo=
dified
> to use time_before() instead of plain, error-prone math.
>=20
> Signed-off-by: Manuel Sch=F6lling <manuel.schoelling@gmx.de>

Applied.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
