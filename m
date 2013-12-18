From: David Miller <davem@davemloft.net>
Date: Wed, 18 Dec 2013 22:54:20 +0000
Subject: Re: [patch v2] isdn: use strlcpy() instead strcpy()
Message-Id: <20131218.175420.144235775285424457.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1387201418.19078.225.camel@edumazet-glaptop2.roam.corp.google.com>
	<20131216094626.GC13831@elgon.mountain>
In-Reply-To: <20131216094626.GC13831@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: isdn@linux-pingi.de, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, eric.dumazet@gmail.com

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 16 Dec 2013 16:56:23 +0300

> I don't think the in-kernel drivers ever hit this strcpy() so this
> doesn't change how the code works.  But strlcpy() is safer.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to net-next, thanks.
