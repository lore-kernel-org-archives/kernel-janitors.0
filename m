From: Joe Perches <joe@perches.com>
Date: Wed, 10 Oct 2012 15:19:07 +0000
Subject: Re: [patch] isdn: fix a wrapping bug in isdn_ppp_ioctl()
Message-Id: <1349882347.2386.47.camel@joe-AO722>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121010093816.GA3669@elgon.mountain>
	 <1349864358.2386.27.camel@joe-AO722> <m21uh67csy.fsf@igel.home>
	 <1349874007.2386.42.camel@joe-AO722> <m2sj9m5sz5.fsf@igel.home>
	 <1349880119.2386.46.camel@joe-AO722>
	 <AE90C24D6B3A694183C094C60CF0A2F6026B7033@saturn3.aculab.com>
In-Reply-To: <AE90C24D6B3A694183C094C60CF0A2F6026B7033@saturn3.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Laight <David.Laight@ACULAB.COM>
Cc: Andreas Schwab <schwab@linux-m68k.org>, Dan Carpenter <dan.carpenter@oracle.com>, Karsten Keil <isdn@linux-pingi.de>, "David S. Miller" <davem@davemloft.net>, Masanari Iida <standby24x7@gmail.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2012-10-10 at 15:59 +0100, David Laight wrote:
> Seems to me the code is expecting 256 bits of data, not any multiple of int,
> long or anything else.

include/linux/isdn_ppp.h:#define PPPIOCGCOMPRESSORS _IOR('t',134,unsigned long [8])


