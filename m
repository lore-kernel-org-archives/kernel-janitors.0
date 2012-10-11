From: David Miller <davem@davemloft.net>
Date: Thu, 11 Oct 2012 02:46:14 +0000
Subject: Re: [patch] isdn: fix a wrapping bug in isdn_ppp_ioctl()
Message-Id: <20121010.224614.1474455483126634181.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121010093816.GA3669@elgon.mountain>
In-Reply-To: <20121010093816.GA3669@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: isdn@linux-pingi.de, standby24x7@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Oct 2012 12:42:18 +0300

> "protos" is an array of unsigned longs and "i" is the number of bits in
> an unsigned long so we need to use 1UL as well to prevent the shift
> from wrapping around.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

I'll apply this, thanks.
