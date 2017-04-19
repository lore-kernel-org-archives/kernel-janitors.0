From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 Apr 2017 10:53:26 +0000
Subject: Re: [PATCH] dp83640: don't recieve time stamps twice
Message-Id: <20170419105326.45khz5ayre75d5i2@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170418191426.GA17838@mwanda>
 <1492593414.3108.1.camel@spectralink.com>
 <20170419103135.GA1670@localhost.localdomain>
In-Reply-To: <20170419103135.GA1670@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Richard Cochran <richardcochran@gmail.com>
Cc: =?iso-8859-1?B?U/hyZW5zZW4s?= Stefan <Stefan.Sorensen@spectralink.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "andrew@lunn.ch" <andrew@lunn.ch>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Wed, Apr 19, 2017 at 12:31:35PM +0200, Richard Cochran wrote:
> On Wed, Apr 19, 2017 at 09:16:56AM +0000, S=F8rensen, Stefan wrote:
> > You are correct that these lines was added accidentally.
>=20
> Can we please fix this in another way?  There is no need to hold the
> spin lock during the callback into the networking stack.  Instead, how
> about the following diff, which also fixes the other call site...
>=20

I'm fine with this.  I hated my changelog, as well because it sounds
like guess work.  Could you send it with a:

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
