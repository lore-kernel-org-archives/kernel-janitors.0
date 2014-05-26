From: David Miller <davem@davemloft.net>
Date: Mon, 26 May 2014 04:40:45 +0000
Subject: Re: [PATCH] wan: time_before()
Message-Id: <20140526.004045.1779020170437806699.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401039163-10727-1-git-send-email-manuel.schoelling@gmx.de>
	<1401040732.22191.8.camel@joe-AO725>
In-Reply-To: <1401040732.22191.8.camel@joe-AO725>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: joe@perches.com
Cc: manuel.schoelling@gmx.de, kevin.curtis@farsite.co.uk, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Joe Perches <joe@perches.com>
Date: Sun, 25 May 2014 10:58:52 -0700

> On Sun, 2014-05-25 at 19:32 +0200, Manuel Sch=F6lling wrote:
>> To be future-proof and for better readability the time comparisons are
>> modified to use time_before() instead of plain, error-prone math.
>=20
> Sensible change, but it seems these should be
> udelay(some_constant) instead of a a rather
> variable time wait based on a system/config
> defined jiffies.

Agreed, this code probably wants udelay(10) or something like
that.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
