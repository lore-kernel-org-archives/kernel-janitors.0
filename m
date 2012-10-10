From: "David Laight" <David.Laight@ACULAB.COM>
Date: Wed, 10 Oct 2012 10:42:36 +0000
Subject: RE: [patch] isdn: fix a wrapping bug in isdn_ppp_ioctl()
Message-Id: <AE90C24D6B3A694183C094C60CF0A2F6026B702D@saturn3.aculab.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121010093816.GA3669@elgon.mountain> <1349864358.2386.27.camel@joe-AO722>
In-Reply-To: <1349864358.2386.27.camel@joe-AO722>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Karsten Keil <isdn@linux-pingi.de>, "David S. Miller" <davem@davemloft.net>, Masanari Iida <standby24x7@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

> -		unsigned long protos[8] = {0,};
> +		DECLARE_BITMAP(protos, BITS_PER_LONG * 8) = { 0, };
...
> -		if ((r = set_arg(argp, protos, 8 * sizeof(long))))
> +		if ((r = set_arg(argp, protos, sizeof(protos))))

That change makes a big assumption about the implementation
of DECLARE_BITMAP().
Unless it is guaranteed to be implemented as 'unsigned long[]'
then you've changed what the code might do.

	David



