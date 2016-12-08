From: David Miller <davem@davemloft.net>
Date: Thu, 08 Dec 2016 19:19:50 +0000
Subject: Re: [patch] ser_gigaset: return -ENOMEM on error instead of success
Message-Id: <20161208.141950.834129897171154805.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161207112203.GC5507@elgon.mountain>
In-Reply-To: <20161207112203.GC5507@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: pebolle@tiscali.nl, tilman@imap.cc, isdn@linux-pingi.de, gigaset307x-common@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 7 Dec 2016 14:22:03 +0300

> If we can't allocate the resources in gigaset_initdriver() then we
> should return -ENOMEM instead of zero.
> 
> Fixes: 2869b23e4b95 ("[PATCH] drivers/isdn/gigaset: new M101 driver (v2)")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied and queued up for -stable, thanks.
