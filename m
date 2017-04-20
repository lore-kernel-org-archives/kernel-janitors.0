From: David Miller <davem@davemloft.net>
Date: Thu, 20 Apr 2017 20:02:27 +0000
Subject: Re: [PATCH] dp83640: don't recieve time stamps twice
Message-Id: <20170420.160227.1855463512293087492.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170418191426.GA17838@mwanda>
        <1492593414.3108.1.camel@spectralink.com>
        <20170419103135.GA1670@localhost.localdomain>
In-Reply-To: <20170419103135.GA1670@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: richardcochran@gmail.com
Cc: Stefan.Sorensen@spectralink.com, dan.carpenter@oracle.com, netdev@vger.kernel.org, f.fainelli@gmail.com, andrew@lunn.ch, kernel-janitors@vger.kernel.org

From: Richard Cochran <richardcochran@gmail.com>
Date: Wed, 19 Apr 2017 12:31:35 +0200

> On Wed, Apr 19, 2017 at 09:16:56AM +0000, S=F8rensen, Stefan wrote:
>> You are correct that these lines was added accidentally.
>=20
> Can we please fix this in another way?  There is no need to hold the
> spin lock during the callback into the networking stack.  Instead, how
> about the following diff, which also fixes the other call site...

Oops, I read this too late.

I already applied and pushed out Dan's fix.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
