From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Aug 2019 09:41:52 +0000
Subject: Re: [PATCH] netfilter: ipset: Fix an error code in ip_set_sockfn_get()
Message-Id: <20190822094152.GJ3964@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190821071830.GI26957@mwanda>
 <alpine.DEB.2.20.1908221109390.11879@blackhole.kfki.hu>
In-Reply-To: <alpine.DEB.2.20.1908221109390.11879@blackhole.kfki.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Kadlecsik =?iso-8859-1?Q?J=F3zsef?= <kadlec@blackhole.kfki.hu>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, Florent Fourcot <florent.fourcot@wifirst.fr>, Kate Stewart <kstewart@linuxfoundation.org>, Allison Randal <allison@lohutok.net>, Aditya Pakki <pakki001@umn.edu>, Qian Cai <cai@gmx.us>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Johannes Berg <johannes.berg@intel.com>, Stefano Brivio <sbrivio@redhat.com>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, kernel-janitors@vger.kernel.org

On Thu, Aug 22, 2019 at 11:11:56AM +0200, Kadlecsik J=F3zsef wrote:
> Hi Dan,
>=20
> On Wed, 21 Aug 2019, Dan Carpenter wrote:
>=20
> > The copy_to_user() function returns the number of bytes remaining to be
> > copied.  In this code, that positive return is checked at the end of the
> > function and we return zero/success.  What we should do instead is
> > return -EFAULT.
>=20
> Yes, you are right. There's another usage of copy_to_user() in this=20
> function, could you fix it as well?
>=20

Yes, of course.  Thanks for the review.

regards,
dan carpenter
