From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Jul 2012 08:37:40 +0000
Subject: Re: [patch -next] net: writes past the end of the struct
Message-Id: <20120711083740.GC6056@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120711063214.GA11812@elgon.mountain>
 <20120711.012745.2202204429130083377.davem@davemloft.net>
In-Reply-To: <20120711.012745.2202204429130083377.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>
Cc: kuznet@ms2.inr.ac.ru, jmorris@namei.org, yoshfuji@linux-ipv6.org, kaber@trash.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jul 11, 2012 at 01:27:45AM -0700, David Miller wrote:
> I asked him to fix some things, he did too much casting, but he never
> respun his patch set.  I definitely prefer this gets fixed his way.
> 

Oooo.  That's a clever trick.  Nice.

regards,
dan carpenter
