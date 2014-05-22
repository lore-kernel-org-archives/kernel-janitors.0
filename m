From: David Miller <davem@davemloft.net>
Date: Thu, 22 May 2014 20:58:44 +0000
Subject: Re: [PATCH] e1000: Use time_after() for time comparison
Message-Id: <20140522.165844.694155605608410652.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400790090-13404-1-git-send-email-manuel.schoelling@gmx.de>
In-Reply-To: <1400790090-13404-1-git-send-email-manuel.schoelling@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: manuel.schoelling@gmx.de
Cc: jeffrey.t.kirsher@intel.com, jesse.brandeburg@intel.com, bruce.w.allan@intel.com, e1000-devel@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Manuel Sch=F6lling <manuel.schoelling@gmx.de>
Date: Thu, 22 May 2014 22:21:30 +0200

> To be future-proof and for better readability the time comparisons are mo=
dified
> to use time_after() instead of plain, error-prone math.
>=20
> Signed-off-by: Manuel Sch=F6lling <manuel.schoelling@gmx.de>

I'll let Jeff pick this up in his tree.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
