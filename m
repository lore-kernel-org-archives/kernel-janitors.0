From: David Miller <davem@davemloft.net>
Date: Thu, 25 Apr 2013 05:49:05 +0000
Subject: Re: [patch] isdn: mISDN: set ->family in ->getname()
Message-Id: <20130425.014905.167442930303199676.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130423062414.GC15893@elgon.mountain>
In-Reply-To: <20130423062414.GC15893@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: isdn@linux-pingi.de, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 23 Apr 2013 09:24:14 +0300

> The "maddr->family" variable was not set but instead it leaked stack
> information to userspace.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
