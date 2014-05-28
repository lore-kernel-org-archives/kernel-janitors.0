From: Kevin Curtis <Kevin.Curtis@farsite.com>
Date: Wed, 28 May 2014 07:09:19 +0000
Subject: RE: [PATCH] wan: time_before()
Message-Id: <E603DC592C92B54A89CEF6B0919A0B1CAFDE223C6D@SOLO.hq.farsitecommunications.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401039163-10727-1-git-send-email-manuel.schoelling@gmx.de>
	<1401040732.22191.8.camel@joe-AO725>
 <20140526.004045.1779020170437806699.davem@davemloft.net>
In-Reply-To: <20140526.004045.1779020170437806699.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: David Miller <davem@davemloft.net>, "joe@perches.com" <joe@perches.com>
Cc: "manuel.schoelling@gmx.de" <manuel.schoelling@gmx.de>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi,
    Yes, a usleep(10) would be just fine.


Regards

Kevin

-----Original Message-----
From: David Miller [mailto:davem@davemloft.net]=20
Sent: 26 May 2014 05:41
To: joe@perches.com
Cc: manuel.schoelling@gmx.de; Kevin Curtis; netdev@vger.kernel.org; linux-k=
ernel@vger.kernel.org; kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] wan: time_before()

From: Joe Perches <joe@perches.com>
Date: Sun, 25 May 2014 10:58:52 -0700

> On Sun, 2014-05-25 at 19:32 +0200, Manuel Sch=F6lling wrote:
>> To be future-proof and for better readability the time comparisons=20
>> are modified to use time_before() instead of plain, error-prone math.
>=20
> Sensible change, but it seems these should be
> udelay(some_constant) instead of a a rather variable time wait based=20
> on a system/config defined jiffies.

Agreed, this code probably wants udelay(10) or something like that.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
