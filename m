From: David Miller <davem@davemloft.net>
Date: Thu, 22 May 2014 19:50:56 +0000
Subject: Re: [PATCH] micrel: Use time_before_eq()
Message-Id: <20140522.155056.1319013021780564009.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400781165-26498-1-git-send-email-manuel.schoelling@gmx.de>
In-Reply-To: <1400781165-26498-1-git-send-email-manuel.schoelling@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: manuel.schoelling@gmx.de
Cc: jg1.han@samsung.com, dingtianhong@huawei.com, ebiederm@xmission.com, Julia.Lawall@lip6.fr, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Manuel Sch=F6lling <manuel.schoelling@gmx.de>
Date: Thu, 22 May 2014 19:52:45 +0200

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
